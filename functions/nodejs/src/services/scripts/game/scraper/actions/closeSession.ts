import { AppError } from '../../../../../utils/error';
import { BrowserSession } from '../../../../types/puppeteer.types';

export default async function closeSession(
  browserSession: BrowserSession,
): Promise<void> {
  try {
    const { browser, incognitoContext } = browserSession;

    if (incognitoContext) {
      incognitoContext.removeAllListeners();
      await incognitoContext.close();
    }

    if (browser && browser.isConnected()) {
      browser.close();
    }
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/puppeteer/close-session-failed',
      error,
      undefined,
      new Error().stack,
    );
  }
}
