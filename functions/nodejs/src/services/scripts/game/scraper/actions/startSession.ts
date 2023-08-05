import puppeteer from 'puppeteer';
import { NODE_ENV } from '../../../../../env';
import { AppError } from '../../../../../utils/error';
import {
  BrowserOptions,
  BrowserSession,
} from '../../../../types/puppeteer.types';

const BROWSER_OPTIONS: BrowserOptions = {
  product: 'chrome',
  headless: NODE_ENV.equals('development') ? false : true,
  slowMo: NODE_ENV.equals('development') ? 100 : 0,
  defaultViewport: {
    width: 1440,
    height: 800,
  },
  args: [
    '--use-fake-ui-for-media-stream',
    '--no-sandbox',
    '--disable-setuid-sandbox',
    '--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188',
  ].concat(
    NODE_ENV.equals('development')
      ? ['--auto-open-devtools-for-tabs', '--start-maximized', '--icognito']
      : [],
  ),
};

export default async function startSession(): Promise<BrowserSession> {
  try {
    const browser = await puppeteer.launch(BROWSER_OPTIONS);

    const incognitoContext = NODE_ENV.equals('development')
      ? await browser.createIncognitoBrowserContext()
      : undefined;

    const page = incognitoContext
      ? await incognitoContext.newPage()
      : await browser.newPage();

    if (incognitoContext) await (await browser.pages())[0].close();

    await page.evaluateOnNewDocument(() => {
      Object.defineProperty(navigator, 'platform', {
        get: () => 'Win32',
      });
      Object.defineProperty(navigator, 'productSub', {
        get: () => '20030107',
      });
      Object.defineProperty(navigator, 'vendor', {
        get: () => 'Google Inc.',
      });
      Object.defineProperty(navigator, 'oscpu', {
        get: () => undefined,
      });
      Object.defineProperty(navigator, 'cpuClass', {
        get: () => undefined,
      });
    });

    await page.setUserAgent(
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188',
    );

    return { browser, incognitoContext, page };
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/puppeteer/start-session-failed',
      error,
      undefined,
      new Error().stack,
    );
  }
}
