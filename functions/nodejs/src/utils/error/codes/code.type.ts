import { AppErrorSeverity } from '../appErrorSeverity.enum';

export type AppErrorCodeType = {
  module: string;
  name: string;
  code: number;
  message: string;
  severity: AppErrorSeverity;
  shouldLog: boolean;
};

export type AppErrorCodeMapType = {
  [key: string]: AppErrorCodeType;
};

export type AppErrorCodeParentMapType = {
  [key: string]: AppErrorCodeMapType;
};

export type AppErrorCodeRootTypeMap = {
  [key: string]: AppErrorCodeParentMapType;
};
