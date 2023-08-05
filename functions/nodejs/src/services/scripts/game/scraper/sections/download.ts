import { Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import {
  DOWNLOADS_ELEMENT_SELECTOR,
  GALLERY_ELEMENT_SELECTOR,
} from './cssSelectors';

export default async function getDownloadSection(
  page: Page,
  removeGallery?: boolean,
): Promise<string> {
  try {
    const downloadsElement = await page.$(DOWNLOADS_ELEMENT_SELECTOR);
    if (!downloadsElement) {
      throw AppError.fromCode(
        'game/scraper/download-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const downloadsText = await page.evaluate(
      (el) => el?.textContent,
      downloadsElement,
    );
    if (!downloadsText) {
      throw AppError.fromCode(
        'game/scraper/read-download-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    // TODO: Rework this - gallery may not be contained inside span
    if (!removeGallery) {
      const galleryElement = await page.$(GALLERY_ELEMENT_SELECTOR);
      const galleryText = await page.evaluate(
        (el) => el?.textContent,
        galleryElement,
      );
      if (!galleryText) {
        throw AppError.fromCode(
          'game/scraper/clean-download-element-failed',
          page.url(),
          new Error().stack,
        );
      }
      return downloadsText.replace(galleryText, '');
    }

    return downloadsText;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/downloads-section-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
