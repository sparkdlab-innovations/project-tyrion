import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  'create-unknown-error': {
    module: 'user/datasources',
    name: 'create-unknown-error',
    code: 500,
    message: 'An unknown error occurred while creating the user entry.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },
};

export default codes;
