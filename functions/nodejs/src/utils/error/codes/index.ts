import { AppErrorCodeRootTypeMap } from './code.type';
import game from './game';
import media from './media';
import taskQueue from './taskQueue';
import user from './user';

export * from './code.type';

const codes: AppErrorCodeRootTypeMap = {
  game,
  media,
  taskQueue,
  user,
};

export default codes;
