import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  'unknown-error': {
    module: 'user/resolver',
    name: 'unknown-error',
    code: 500,
    message: 'An unknown error occurred.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },
};

export default codes;
