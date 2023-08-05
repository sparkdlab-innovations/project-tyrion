import { getFirestore } from 'firebase-admin/firestore';
import {
  FirestoreEvent,
  QueryDocumentSnapshot,
} from 'firebase-functions/v2/firestore';
import moment from 'moment';
import { isNewGameTaskQueueType } from '../../../data/guards/taskQueue/newGameTaskQueue.guard';
import { GameType } from '../../../data/types/game';
import { TaskStatus } from '../../../data/types/taskQueue/taskStatus.enum';
import {
  GAMES_MAIN_SOURCE_LINK,
  GAMES_MAIN_SOURCE_PASSWORD,
  GAMES_MAIN_SOURCE_USERNAME,
} from '../../../env';
import AppError from '../../../utils/error/appError';
import {
  getGameData,
  loginSession,
  startSession,
} from '../../scripts/game/scraper';

/**
 * Fetch and add a new game to the database.
 * @param {FirestoreEvent<QueryDocumentSnapshot | undefined, { taskId: string }>} event
 * @return {Promise<void>}
 */
export default async function addNewGame(
  event: FirestoreEvent<QueryDocumentSnapshot | undefined, { taskId: string }>,
): Promise<void> {
  const {
    data: document,
    params: { taskId },
  } = event;

  const _documentReference = getFirestore()
    .collection('internalTaskQueue/games/new')
    .doc(taskId);

  if (!document) {
    const error = AppError.fromCode(
      'game/resolver/data-missing',
      taskId,
      new Error().stack,
    );
    await _documentReference.update({
      status: TaskStatus.failed,
      progress: 100,
      error: error.toString(),
      updatedAt: Date.now(),
    });
    throw error;
  }

  const _data = document.data();

  if (!isNewGameTaskQueueType(_data)) {
    const error = AppError.fromCode(
      'game/resolver/invalid-data',
      taskId,
      new Error().stack,
    );
    await _documentReference.update({
      status: TaskStatus.failed,
      progress: 100,
      error: error.toString(),
      updatedAt: Date.now(),
    });
    throw error;
  }

  _documentReference.update({
    status: TaskStatus.inProgress,
    progress: 0,
    message: 'Starting new environment...',
    updatedAt: Date.now(),
  });

  try {
    const _browserSession = await startSession();

    _documentReference.update({
      status: TaskStatus.inProgress,
      progress: 20,
      message: 'Setting up environment...',
      updatedAt: Date.now(),
    });

    await loginSession(
      _browserSession,
      GAMES_MAIN_SOURCE_USERNAME.value(),
      GAMES_MAIN_SOURCE_PASSWORD.value(),
    );

    _documentReference.update({
      status: TaskStatus.inProgress,
      progress: 40,
      message: 'Retrieving game data...',
      updatedAt: Date.now(),
    });

    const _rawGameData = await getGameData(
      _browserSession,
      _data.threadId.toString(),
      false,
    );

    const _gameData: GameType = {
      name: _rawGameData.name,
      description: _rawGameData.description,
      pageUrl: `https://${GAMES_MAIN_SOURCE_LINK.value()}/threads/${
        _data.threadId
      }`,
      coverImageUrl: _rawGameData.coverImage,
      galleryImageUrls: _rawGameData.gallery,
      genres: _rawGameData.headerGenres,
      tags: _rawGameData.tags,
      status: _rawGameData.status,
      version: _rawGameData.version,
      releaseDate: moment(_rawGameData.releaseDate).unix(),
      threadUpdated: moment(_rawGameData.threadUpdated).unix(),
      developer: _rawGameData.developer,
      engine: _rawGameData.engine,
      os: _rawGameData.os,
      languages: _rawGameData.languages,
      censored: _rawGameData.censored,
    };

    /*
    const _extendedGameData: GameType = {
      ..._basicGameData,
      // developerUrl: _rawGameData.developerUrl,
      downloadText: _rawGameData.downloadsTextContent,
      // downloadLinks: _rawGameData.downloadLinks,
      otherContent: _rawGameData.parsedSpoilers ?? [],
    };
    */

    _documentReference.update({
      status: TaskStatus.inProgress,
      progress: 80,
      message: 'Creating new game entry...',
      updatedAt: Date.now(),
    });

    await getFirestore()
      .collection('games')
      .doc(_data.threadId.toString())
      .set(_gameData);

    _documentReference.update({
      status: TaskStatus.successful,
      progress: 100,
      message: 'New game added successfully.',
      updatedAt: Date.now(),
    });
  } catch (e) {
    const error = AppError.fromErrorOrCode(
      'game/resolver/unknown-error',
      e,
      taskId,
      new Error().stack,
    );
    await _documentReference.update({
      status: TaskStatus.failed,
      progress: 100,
      error: error.toString(),
      updatedAt: Date.now(),
    });
    throw error;
  }
}
