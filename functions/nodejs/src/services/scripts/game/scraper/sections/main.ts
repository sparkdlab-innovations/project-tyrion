import { Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import { BASE_ELEMENT_SELECTOR } from './cssSelectors';

export default async function getMainSection(page: Page): Promise<string> {
  try {
    const mainElement = await page.$(BASE_ELEMENT_SELECTOR);
    if (!mainElement) {
      throw AppError.fromCode(
        'game/scraper/main-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const mainTextContent = await page.evaluate(
      (el) => el?.textContent,
      mainElement,
    );
    if (!mainTextContent) {
      throw AppError.fromCode(
        'game/scraper/read-main-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    return mainTextContent;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/main-section-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
