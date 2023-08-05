import { AppErrorCodeRootTypeMap } from './code.type';
import game from './game';

export * from './code.type';

const codes: AppErrorCodeRootTypeMap = {
  game,
};

export default codes;
