import { TaskQueueType } from '../../types/taskQueue';

/**
 * Checks if the provided data is a valid TaskQueueType.
 * @param {unknown} task
 * @return {TaskQueueType}
 */
export default function isTaskQueueType(task: unknown): task is TaskQueueType {
  if (typeof task !== 'object' || task === null) {
    return false;
  }

  const { id, status, progress, error, message, createdAt, updatedAt } =
    task as TaskQueueType;

  if (typeof id !== 'string' && typeof id !== 'undefined') {
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
