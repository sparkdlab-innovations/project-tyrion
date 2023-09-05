import { WriteResult, getFirestore } from 'firebase-admin/firestore';
import { AppError } from '../../../utils/error';
import { AppSegment } from '../../types/shared';
import { TaskQueueType } from '../../types/taskQueue';

export default async function updateTaskQueueById<T = TaskQueueType>(
  segment: AppSegment,
  action: string,
  id: string,
  data: Partial<T>,
): Promise<WriteResult> {
  try {
    const _documentReference = getFirestore()
      .collection(`internalTaskQueue`)
      .doc(segment)
      .collection(action)
      .doc(id);

    const _writeResult = await _documentReference.update(data, {
      exists: true,
    });

    return _writeResult;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'taskQueue/datasources/update-unknown-error',
      error,
      `${segment}/${action}/${id}`,
      new Error().stack,
    );
  }
}
