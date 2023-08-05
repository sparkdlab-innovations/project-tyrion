import { AppError } from '../../../../../utils/error';
import { BrowserSession } from '../../../../types/puppeteer.types';
import checkErrorPage from './checkErrorPage';

export default async function navigateSession(
  browserSession: BrowserSession,
  url: string,
): Promise<void> {
  try {
    const { page } = browserSession;

    await page.goto(url);

    const title = await page.title();

    const error = checkErrorPage(title, true);
    if (error) {
      throw AppError.fromCode(error, `${title} | ${url}`, new Error().stack);
    }

    return;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/puppeteer/navigate-session-failed',
      error,
      url,
      new Error().stack,
    );
  }
}
