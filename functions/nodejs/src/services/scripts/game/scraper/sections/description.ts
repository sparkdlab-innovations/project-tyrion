import { Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import { DESCRIPTION_ELEMENT_SELECTOR } from './cssSelectors';

export default async function getDescriptionSection(
  page: Page,
): Promise<string> {
  try {
    const descriptionElement = await page.$(DESCRIPTION_ELEMENT_SELECTOR);
    if (!descriptionElement) {
      throw AppError.fromCode(
        'game/scraper/description-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const descriptionText = await page.evaluate(
      (el) => el?.textContent,
      descriptionElement,
    );
    if (!descriptionText) {
      throw AppError.fromCode(
        'game/scraper/read-description-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    return descriptionText;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/description-section-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
