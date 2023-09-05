import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  'read-unknown-error': {
    module: 'taskQueue/datasources',
    name: 'read-unknown-error',
    code: 500,
    message: 'An unknown error occurred while reading the task queue.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },

  'read-not-found': {
    module: 'taskQueue/datasources',
    name: 'read-not-found',
    code: 404,
    message: 'The task queue item was not found.',
    severity: AppErrorSeverity.low,
    shouldLog: false,
  },
  'invalid-data': {
    module: 'taskQueue/datasources',
    name: 'invalid-data',
    code: 500,
    message: 'The task queue item data is invalid.',
    severity: AppErrorSeverity.medium,
    shouldLog: false,
  },

  'update-unknown-error': {
    module: 'taskQueue/datasources',
    name: 'update-unknown-error',
    code: 500,
    message: 'An unknown error occurred while updating the task queue.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
};

export default codes;
