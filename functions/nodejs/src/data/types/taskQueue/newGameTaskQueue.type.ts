import { TaskStatus } from './taskStatus.enum';

export type NewGameTaskQueueType = {
  id?: string;
  threadId: number;
  status: TaskStatus;
  progress?: number;
  error?: string;
  message?: string;
  createdAt: number;
  updatedAt?: number;
};
