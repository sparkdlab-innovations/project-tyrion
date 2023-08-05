import { TaskStatus } from './taskStatus.enum';

export type NewGameTaskQueueType = {
  id?: string;
  url: string;
  status: TaskStatus;
  progress?: number;
  error?: string;
  message?: string;
  createdAt: number;
  updatedAt?: number;
};
