import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  'data-missing': {
    module: 'game/resolver',
    name: 'data-missing',
    code: 400,
    message: 'No data was provided for the new game runner.',
    severity: AppErrorSeverity.fatal,
    shouldLog: true,
  },
  'invalid-data': {
    module: 'game/resolver',
    name: 'invalid-data',
    code: 400,
    message: 'Invalid data was provided for the new game runner.',
    severity: AppErrorSeverity.fatal,
    shouldLog: true,
  },
  'unknown-error': {
    module: 'game/resolver',
    name: 'unknown-error',
    code: 500,
    message: 'An unknown error occurred while retrieving the new game.',
    severity: AppErrorSeverity.fatal,
    shouldLog: true,
  },
};

export default codes;
