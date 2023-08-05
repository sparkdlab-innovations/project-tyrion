import { NewGameTaskQueueType } from '../../types/taskQueue/newGameTaskQueue.type';

/**
 * Checks if the provided data is a valid NewGameTaskQueueType.
 * @param {unknown} task
 * @return {NewGameTaskQueueType}
 */
export function isNewGameTaskQueueType(
  task: unknown,
): task is NewGameTaskQueueType {
  if (typeof task !== 'object' || task === null) {
    return false;
  }

  const { id, url, status, progress, error, message, createdAt, updatedAt } =
    task as NewGameTaskQueueType;

  if (typeof id !== 'string' && typeof id !== 'undefined') {
    return false;
  }

  if (typeof url !== 'string') {
    return false;
  }

  if (typeof status !== 'number') {
    return false;
  }

  if (typeof progress !== 'number' && typeof progress !== 'undefined') {
    return false;
  }

  if (typeof error !== 'string' && typeof error !== 'undefined') {
    return false;
  }

  if (typeof message !== 'string' && typeof message !== 'undefined') {
    return false;
  }

  if (typeof createdAt !== 'number') {
    return false;
  }

  if (typeof updatedAt !== 'number' && typeof updatedAt !== 'undefined') {
    return false;
  }

  return true;
}
