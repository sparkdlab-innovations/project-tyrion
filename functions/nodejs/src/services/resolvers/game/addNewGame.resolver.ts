import {
  FirestoreEvent,
  QueryDocumentSnapshot,
} from 'firebase-functions/v2/firestore';
import moment from 'moment';
import { isNewGameTaskQueueType } from '../../../data/guards/taskQueue';
import { isNewGameTaskQueueType } from '../../../data/guards/taskQueue/newGameTaskQueue.guard';
import { updateTaskQueueById } from '../../../data/sources/taskQueue';
import { GameType } from '../../../data/types/game';
import { TaskStatus } from '../../../data/types/taskQueue';
import { GAMES_MAIN_SOURCE_LINK } from '../../../env';
import { AppError } from '../../../utils/error';
import {
  closeSession,
  getGameData,
  // loginSession,
  startSession,
} from '../../scripts/game/scraper';
import { uploadMedia } from '../../scripts/media';

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

  if (!document) {
    const error = AppError.fromCode(
      'game/resolver/data-missing',
      taskId,
      new Error().stack,
    );
    await updateTaskQueueById('games', 'new', taskId, {
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
    await updateTaskQueueById('games', 'new', taskId, {
      status: TaskStatus.failed,
      progress: 100,
      error: error.toString(),
      updatedAt: Date.now(),
    });
    throw error;
  }

  await updateTaskQueueById('games', 'new', taskId, {
    status: TaskStatus.inProgress,
    progress: 0,
    message: 'Starting new environment...',
    updatedAt: Date.now(),
  });

  try {
    const _browserSession = await startSession();

    // await updateTaskQueueById('games', 'new', taskId, {
    //   status: TaskStatus.inProgress,
    //   progress: 20,
    //   message: 'Setting up environment...',
    //   updatedAt: Date.now(),
    // });

    // await loginSession(
    //   _browserSession,
    //   GAMES_MAIN_SOURCE_USERNAME.value(),
    //   GAMES_MAIN_SOURCE_PASSWORD.value(),
    // );

    let statusUpdatePromises = updateTaskQueueById('games', 'new', taskId, {
      status: TaskStatus.inProgress,
      progress: 20,
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

    statusUpdatePromises = statusUpdatePromises.then(() =>
      updateTaskQueueById('games', 'new', taskId, {
        status: TaskStatus.inProgress,
        progress: 50,
        message: 'Uploading images...',
        updatedAt: Date.now(),
      }),
    );

    _gameData.galleryImageUrls = await Promise.all(
      _gameData.galleryImageUrls.map(async (url, index) => {
        const _media = await uploadMedia(
          url as string,
          index.toString(),
          'url',
          `games/${_data.threadId}`,
          [_data.threadId.toString(), url as string],
          true,
          false,
        );
        return _media;
      }),
    );

    _gameData.coverImageUrl = await uploadMedia(
      _gameData.coverImageUrl as string,
      'cover',
      'url',
      `games/${_data.threadId}`,
      [_data.threadId.toString(), _gameData.coverImageUrl as string],
      true,
      false,
    );

    /*
    const _extendedGameData: GameType = {
      ..._basicGameData,
      // developerUrl: _rawGameData.developerUrl,
      downloadText: _rawGameData.downloadsTextContent,
      // downloadLinks: _rawGameData.downloadLinks,
      otherContent: _rawGameData.parsedSpoilers ?? [],
    };
    */

    statusUpdatePromises = statusUpdatePromises.then(() =>
      updateTaskQueueById('games', 'new', taskId, {
        status: TaskStatus.inProgress,
        progress: 80,
        message: 'Creating new game entry...',
        updatedAt: Date.now(),
      }),
    );

    await getFirestore()
      .collection('games')
      .doc(_data.threadId.toString())
      .set(_gameData);

    await statusUpdatePromises;
    await updateTaskQueueById('games', 'new', taskId, {
      status: TaskStatus.inProgress,
      progress: 90,
      message: 'Closing environment...',
      updatedAt: Date.now(),
    });

    await closeSession(_browserSession);

    await updateTaskQueueById('games', 'new', taskId, {
      status: TaskStatus.successful,
      progress: 100,
      message: 'New game added successfully.',
      updatedAt: Date.now(),
    });

    return;
  } catch (e) {
    const error = AppError.fromErrorOrCode(
      'game/resolver/unknown-error',
      e,
      taskId,
      new Error().stack,
    );
    await updateTaskQueueById('games', 'new', taskId, {
      status: TaskStatus.failed,
      progress: 100,
      error: error.toString(),
      updatedAt: Date.now(),
    });
    throw error;
  }
}
