import { NewGameTaskQueueType } from '../../types/taskQueue';
import isTaskQueueType from './taskQueue.guard';

/**
 * Checks if the provided data is a valid NewGameTaskQueueType.
 * @param {unknown} task
 * @return {NewGameTaskQueueType}
 */
export default function isNewGameTaskQueueType(
  task: unknown,
): task is NewGameTaskQueueType {
  if (typeof task !== 'object' || task === null) {
    return false;
  }

  if (!isTaskQueueType(task)) {
    return false;
  }

  const { threadId } = task as NewGameTaskQueueType;

  if (typeof threadId !== 'number') {
    return false;
  }

  return true;
}
