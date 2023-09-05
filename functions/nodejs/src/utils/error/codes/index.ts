import { AppErrorCodeRootTypeMap } from './code.type';
import game from './game';
import media from './media';
import taskQueue from './taskQueue';

export * from './code.type';

const codes: AppErrorCodeRootTypeMap = {
  game,
  media,
  taskQueue,
};

export default codes;
