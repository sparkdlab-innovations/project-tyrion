import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  'unknown-upload-error': {
    module: 'media/imagekit',
    name: 'unknown-upload-error',
    code: 500,
    message: 'An unknown error occurred while uploading the media.',
    severity: AppErrorSeverity.high,
    shouldLog: false,
  },
};

export default codes;
