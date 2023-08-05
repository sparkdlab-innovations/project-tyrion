import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  // ERROR PAGES
  'backup-page-error': {
    module: 'game/puppeteer',
    name: 'backup-page-error',
    code: 500,
    message:
      'The servers are currently undergoing a backup. Please try again in a few minutes.',
    severity: AppErrorSeverity.high,
    shouldLog: false,
  },
  'maintenance-page-error': {
    module: 'game/puppeteer',
    name: 'maintenance-page-error',
    code: 500,
    message:
      'The servers are currently undergoing maintenance. Please try again later.',
    severity: AppErrorSeverity.high,
    shouldLog: false,
  },
  'not-found-page-error': {
    module: 'game/puppeteer',
    name: 'not-found-page-error',
    code: 500,
    message: 'The server could not find the requested page.',
    severity: AppErrorSeverity.high,
    shouldLog: false,
  },
  'ddos-guard-page-error': {
    module: 'game/puppeteer',
    name: 'ddos-guard-page-error',
    code: 500,
    message:
      'The DDoS Guard has blocked your request. Please try again later or contact support.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },
  'unknown-page-error': {
    module: 'game/puppeteer',
    name: 'unknown-page-error',
    code: 500,
    message: 'An unknown error has occurred. Please try again later.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },

  // START SESSION
  'start-session-failed': {
    module: 'game/puppeteer',
    name: 'start-session-failed',
    code: 500,
    message: 'Failed to start a new browser session.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // LOGIN SESSION
  'login-session-failed': {
    module: 'game/puppeteer',
    name: 'login-session-failed',
    code: 500,
    message: 'Failed to login to the source.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // NAVIGATE SESSION
  'navigate-session-failed': {
    module: 'game/puppeteer',
    name: 'navigate-session-failed',
    code: 500,
    message: 'Failed to navigate to the requested page.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // CLOSE SESSION
  'close-session-failed': {
    module: 'game/puppeteer',
    name: 'close-session-failed',
    code: 500,
    message: 'Failed to close the browser session.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },
};

export default codes;
