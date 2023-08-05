import { Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import {
  DOWNLOADS_ELEMENT_SELECTOR,
  GALLERY_IMAGE_ELEMENT_SELECTOR,
} from './cssSelectors';

export default async function getGallerySection(page: Page): Promise<string[]> {
  try {
    const downloadsElement = await page.$(DOWNLOADS_ELEMENT_SELECTOR);
    if (!downloadsElement) {
      throw AppError.fromCode(
        'game/scraper/download-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const galleryItemElements = await downloadsElement.$$(
      GALLERY_IMAGE_ELEMENT_SELECTOR,
    );
    if (!galleryItemElements) {
      throw AppError.fromCode(
        'game/scraper/gallery-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const galleryItemTexts = await Promise.all(
      galleryItemElements.map(async (el) => {
        const galleryItem = await page.evaluate(
          (elem) => elem?.getAttribute('href')?.toString().trim(),
          el,
        );
        return galleryItem ?? '';
      }),
    );

    const galleryItems = galleryItemTexts.filter(
      (galleryItem) =>
        galleryItem !== '' &&
        new RegExp(
          /^(https:\/\/)(?:([a-zA-Z0-9-]+?)\.)?([a-zA-Z0-9-]+?)\.([a-z]{2,}|[a-z]{2,5}\.[a-z]{2})/,
        ).test(galleryItem),
    );
    if (galleryItems.length <= 0) {
      throw AppError.fromCode(
        'game/scraper/read-gallery-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    return galleryItems;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/gallery-section-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
