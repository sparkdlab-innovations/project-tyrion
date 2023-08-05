import { AppError } from '../../../../../utils/error';

export default function checkErrorPage(
  title: string,
  noError: boolean = false,
): string | void {
  if (title.match(new RegExp('backup', 'i'))) {
    if (noError) {
      return 'game/puppeteer/backup-page-error';
    }
    throw AppError.fromCode(
      'game/puppeteer/backup-page-error',
      title,
      new Error().stack,
    );
  }
  if (title.match(new RegExp('maintenance', 'i'))) {
    if (noError) {
      return 'game/puppeteer/maintenance-page-error';
    }
    throw AppError.fromCode(
      'game/puppeteer/maintenance-page-error',
      title,
      new Error().stack,
    );
  }
  if (title.match(new RegExp('not found', 'i'))) {
    if (noError) {
      return 'game/puppeteer/not-found-page-error';
    }
    throw AppError.fromCode(
      'game/puppeteer/not-found-page-error',
      title,
      new Error().stack,
    );
  }
  if (
    title.match(new RegExp('ddos', 'i')) ||
    title.match(new RegExp('guard', 'i'))
  ) {
    if (noError) {
      return 'game/puppeteer/ddos-guard-page-error';
    }
    throw AppError.fromCode(
      'game/puppeteer/ddos-guard-page-error',
      title,
      new Error().stack,
    );
  }
  if (title.match(new RegExp('error', 'i'))) {
    if (noError) {
      return 'game/puppeteer/unknown-page-error';
    }
    throw AppError.fromCode(
      'game/puppeteer/unknown-page-error',
      title,
      new Error().stack,
    );
  }

  // TODO: Add more error page checks
  return;
}
