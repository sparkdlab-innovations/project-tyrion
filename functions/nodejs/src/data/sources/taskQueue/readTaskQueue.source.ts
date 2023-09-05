import { getFirestore } from 'firebase-admin/firestore';
import { AppError } from '../../../utils/error';
import { isTaskQueueType } from '../../guards/taskQueue';
import { AppSegment } from '../../types/shared';
import { TaskQueueType } from '../../types/taskQueue';

export default async function readTaskQueueById<T = TaskQueueType>(
  segment: AppSegment,
  action: string,
  id: string,
): Promise<T> {
  try {
    const _documentReference = getFirestore()
      .collection(`internalTaskQueue`)
      .doc(segment)
      .collection(action)
      .doc(id);

    const _document = await _documentReference.get();

    if (!_document.exists) {
      throw AppError.fromCode(
        'taskQueue/datasources/read-not-found',
        `${segment}/${action}/${id}}`,
        new Error().stack,
      );
    }

    const _data = _document.data();

    if (!_data || isTaskQueueType(_data)) {
      throw AppError.fromCode(
        'taskQueue/datasources/invalid-data',
        `${segment}/${action}/${id}}`,
        new Error().stack,
      );
    }

    return _data as T;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'taskQueue/datasources/read-unknown-error',
      error,
      `${segment}/${action}/${id}`,
      new Error().stack,
    );
  }
}
