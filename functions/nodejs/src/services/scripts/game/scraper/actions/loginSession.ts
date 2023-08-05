import { GAMES_MAIN_SOURCE_LINK } from '../../../../../env';
import { AppError } from '../../../../../utils/error';
import { BrowserSession } from '../../../../types/puppeteer.types';
import checkErrorPage from './checkErrorPage';

export default async function loginSession(
  browserSession: BrowserSession,
  username: string,
  password: string,
): Promise<void> {
  try {
    const { page } = browserSession;

    await page.goto(`https://${GAMES_MAIN_SOURCE_LINK.value()}/login`);

    await Promise.all([
      page.waitForSelector('form[action="/login/login"]'),
      page.waitForSelector('input[name="login"][autocomplete="username"]'),
      page.waitForSelector(
        'input[name="password"][autocomplete="current-password"]',
      ),
    ]);

    await Promise.all([
      page.$eval(
        'input[name="login"][autocomplete="username"]',
        (el, value) => (el.value = value),
        username,
      ),
      page.$eval(
        'input[name="password"][autocomplete="current-password"]',
        (el, value) => (el.value = value),
        password,
      ),
    ]);

    await Promise.all([
      page.waitForSelector('input[name="remember"][type="checkbox"]'),
      page.waitForSelector('button[type="submit"]'),
    ]);

    const rememberMe = await page.$('input[name="remember"][type="checkbox"]');
    if (!(await (await rememberMe?.getProperty('checked'))?.jsonValue())) {
      await rememberMe?.click();
    }

    await Promise.all([
      page.waitForNavigation({
        waitUntil: 'networkidle2',
      }),
      page.click('button[type="submit"]'),
    ]);

    const title = await page.title();
    checkErrorPage(title);

    return;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/puppeteer/login-session-failed',
      error,
      new Error().stack,
    );
  }
}
