import { AppErrorSeverity } from '../../appErrorSeverity.enum';
import { AppErrorCodeMapType } from '../code.type';

const codes: AppErrorCodeMapType = {
  // MAIN
  'game-scraper-unknown-error': {
    module: 'game/scraper',
    name: 'game-scraper-unknown-error',
    code: 500,
    message: 'An unknown error occurred while scraping the game.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // TITLE
  'title-format-mismatch': {
    module: 'game/scraper',
    name: 'title-format-mismatch',
    code: 400,
    message: "The title's format does not match the expected format.",
    severity: AppErrorSeverity.medium,
    shouldLog: true,
  },
  'parse-title-failed': {
    module: 'game/scraper',
    name: 'parse-title-failed',
    code: 400,
    message: 'We were unable to parse the title.',
    severity: AppErrorSeverity.low,
    shouldLog: true,
  },

  // HEADER
  'header-genre-element-not-found': {
    module: 'game/scraper',
    name: 'header-genre-element-not-found',
    code: 500,
    message: 'We were unable to find the genres on the header of the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'read-header-genre-element-failed': {
    module: 'game/scraper',
    name: 'read-header-genre-element-failed',
    code: 500,
    message: 'We were unable to read the genres on the header of the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'header-image-element-not-found': {
    module: 'game/scraper',
    name: 'header-image-element-not-found',
    code: 500,
    message:
      'We were unable to find the cover image on the header of the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'read-header-image-element-failed': {
    module: 'game/scraper',
    name: 'read-header-image-element-failed',
    code: 500,
    message:
      'We were unable to read the cover image on the header of the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'header-section-unknown-error': {
    module: 'game/scraper',
    name: 'header-section-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the header.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // MAIN
  'main-element-not-found': {
    module: 'game/scraper',
    name: 'main-element-not-found',
    code: 500,
    message: 'We were unable to find the main section on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'read-main-element-failed': {
    module: 'game/scraper',
    name: 'read-main-element-failed',
    code: 500,
    message: 'We were unable to read the main section on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'main-section-unknown-error': {
    module: 'game/scraper',
    name: 'main-section-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the main section.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // BLOCKED SECTIONS
  'blocked-sections-unknown-error': {
    module: 'game/scraper',
    name: 'blocked-sections-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the blocked sections.',
    severity: AppErrorSeverity.critical,
    shouldLog: false,
  },

  // SPOILERS
  'read-spoilers-element-failed': {
    module: 'game/scraper',
    name: 'read-spoilers-element-failed',
    code: 500,
    message: 'We were unable to read the spoilers on the page.',
    severity: AppErrorSeverity.medium,
    shouldLog: true,
  },
  'spoilers-section-unknown-error': {
    module: 'game/scraper',
    name: 'spoilers-section-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the spoilers.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },
  'spoiler-format-mismatch': {
    module: 'game/scraper',
    name: 'spoiler-format-mismatch',
    code: 400,
    message: "The spoiler's format does not match the expected format.",
    severity: AppErrorSeverity.medium,
    shouldLog: true,
  },
  'parse-spoilers-timeout': {
    module: 'game/scraper',
    name: 'parse-spoilers-timeout',
    code: 500,
    message: 'We were unable to parse the spoilers on the page.',
    severity: AppErrorSeverity.low,
    shouldLog: false,
  },
  'parse-spoilers-unknown-error': {
    module: 'game/scraper',
    name: 'parse-spoilers-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the spoilers.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // DESCRIPTION
  'description-element-not-found': {
    module: 'game/scraper',
    name: 'description-element-not-found',
    code: 500,
    message: 'We were unable to find the description on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'read-description-element-failed': {
    module: 'game/scraper',
    name: 'read-description-element-failed',
    code: 500,
    message: 'We were unable to read the description on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'parse-description-failed': {
    module: 'game/scraper',
    name: 'parse-description-failed',
    code: 400,
    message: 'We were unable to parse the description on the page.',
    severity: AppErrorSeverity.low,
    shouldLog: false,
  },
  'description-section-unknown-error': {
    module: 'game/scraper',
    name: 'description-section-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the description.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // DOWNLOADS
  'download-element-not-found': {
    module: 'game/scraper',
    name: 'download-element-not-found',
    code: 500,
    message: 'We were unable to find the download section on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'read-download-element-failed': {
    module: 'game/scraper',
    name: 'read-download-element-failed',
    code: 500,
    message: 'We were unable to read the download section on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'clean-download-element-failed': {
    module: 'game/scraper',
    name: 'clean-download-element-failed',
    code: 500,
    message: 'We were unable to clean the download section on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: false,
  },
  'downloads-section-unknown-error': {
    module: 'game/scraper',
    name: 'downloads-section-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the downloads.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },

  // GALLERY
  'gallery-element-not-found': {
    module: 'game/scraper',
    name: 'gallery-element-not-found',
    code: 500,
    message: 'We were unable to find the gallery section on the page.',
    severity: AppErrorSeverity.high,
    shouldLog: true,
  },
  'read-gallery-element-failed': {
    module: 'game/scraper',
    name: 'read-gallery-element-failed',
    code: 500,
    message: 'We were unable to read the gallery section on the page.',
    severity: AppErrorSeverity.medium,
    shouldLog: true,
  },
  'gallery-section-unknown-error': {
    module: 'game/scraper',
    name: 'gallery-section-unknown-error',
    code: 500,
    message: 'An unknown error occurred while parsing the gallery.',
    severity: AppErrorSeverity.critical,
    shouldLog: true,
  },
};

export default codes;
