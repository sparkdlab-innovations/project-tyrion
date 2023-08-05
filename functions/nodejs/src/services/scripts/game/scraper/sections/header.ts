import { Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import {
  HEADER_GENRE_ELEMENT_SELECTOR,
  HEADER_IMAGE_AUTHENTICATED_SELECTOR,
  HEADER_IMAGE_NOT_AUTHENTICATED_SELECTOR,
} from './cssSelectors';

export default async function getHeaderSection(
  page: Page,
  isAuthenticated: boolean,
): Promise<{
  genres: string[];
  coverImage: string;
}> {
  try {
    const headerGenresElement = await page.$$(HEADER_GENRE_ELEMENT_SELECTOR);
    if (!headerGenresElement || headerGenresElement.length <= 0) {
      throw AppError.fromCode(
        'game/scraper/header-genre-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const genreTexts = await Promise.all(
      headerGenresElement.map(async (el) => {
        const genre = await page.evaluate(
          (elem) =>
            elem
              ?.getAttribute('href')
              ?.toString()
              .split('/')
              .slice(-2, -1)[0]
              .trim(),
          el,
        );
        return genre ?? '';
      }),
    );
    const genres = genreTexts.filter((genre) => genre !== '');
    if (genres.length <= 0) {
      throw AppError.fromCode(
        'game/scraper/read-header-genre-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    const headerImageElement = await page.$(
      isAuthenticated
        ? HEADER_IMAGE_AUTHENTICATED_SELECTOR
        : HEADER_IMAGE_NOT_AUTHENTICATED_SELECTOR,
    );
    if (!headerImageElement) {
      throw AppError.fromCode(
        'game/scraper/header-image-element-not-found',
        page.url(),
        new Error().stack,
      );
    }

    const coverImage = await page.evaluate(
      (el, isAuthenticated) =>
        el?.getAttribute(isAuthenticated ? 'src' : 'href'),
      headerImageElement,
      isAuthenticated,
    );
    if (
      !coverImage ||
      !new RegExp(
        /^(https:\/\/)(?:([a-zA-Z0-9-]+?)\.)?([a-zA-Z0-9-]+?)\.([a-z]{2,}|[a-z]{2,5}\.[a-z]{2})/,
      ).test(coverImage)
    ) {
      throw AppError.fromCode(
        'game/scraper/read-header-image-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    return {
      genres,
      coverImage,
    };
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/header-section-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
