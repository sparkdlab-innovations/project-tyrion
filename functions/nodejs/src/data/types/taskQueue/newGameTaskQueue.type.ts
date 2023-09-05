import { TaskQueueType } from './taskQueue.type';

export type NewGameTaskQueueType = TaskQueueType & {
  threadId: number;
};
