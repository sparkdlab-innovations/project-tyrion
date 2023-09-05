import { TaskStatus } from './taskStatus.enum';

export type TaskQueueType = {
  id?: string;
  status: TaskStatus;
  progress?: number;
  error?: string;
  message?: string;
  createdAt: number;
  updatedAt?: number;
  [key: string]: unknown;
};
