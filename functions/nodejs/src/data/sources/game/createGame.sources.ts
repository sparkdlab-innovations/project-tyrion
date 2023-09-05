import { WriteResult, getFirestore } from 'firebase-admin/firestore';
import { AppError } from '../../../utils/error';
import { GameType } from '../../types/game';

export default async function createGame(
  threadId: number,
  data: GameType,
): Promise<WriteResult> {
  try {
    const _writeResult = await getFirestore()
      .collection('games')
      .doc(threadId.toString())
      .set(data, {
        merge: false,
      });

    return _writeResult;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/datasources/update-unknown-error',
      error,
      `${threadId}`,
      new Error().stack,
    );
  }
}
