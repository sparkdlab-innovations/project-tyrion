import { getFirestore, WriteResult } from 'firebase-admin/firestore';
import { AppError } from '../../../utils/error';
import { BasicUserInterface, UserInterface } from '../../types/user';

export default async function createUserRecord(
  userId: string,
  data: AtLeast<BasicUserInterface, UserInterface>,
): Promise<WriteResult> {
  try {
    const _writeResult = await getFirestore()
      .collection('users')
      .doc(userId)
      .set(data, {
        merge: false,
      });

    return _writeResult;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'user/datasources/create-unknown-error',
      error,
      `${userId}`,
      new Error().stack,
    );
  }
}
