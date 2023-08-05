import { ElementHandle, Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import { NestedSpoiler, Spoiler } from '../../../../types/gameScraper.types';
import {
  BASE_ELEMENT_SELECTOR,
  DESCRIPTION_SPOILER_ELEMENT_SELECTOR,
  DOWNLOADS_SPOILER_ELEMENT_SELECTOR,
  NESTED_SPOILER_ELEMENT_SELECTOR,
  SPOILER_ELEMENT_SELECTOR,
} from './cssSelectors';

async function getNestedSpoilers(
  page: Page,
  rootSpoilers: ElementHandle<HTMLDivElement>[],
): Promise<NestedSpoiler[]> {
  const nestedSpoilers = await Promise.all(
    rootSpoilers.map<Promise<NestedSpoiler>>(async (rootSpoiler) => {
      const nestedSpoilerText = await page.evaluate(
        (_el) => _el?.textContent,
        rootSpoiler,
      );
      if (!nestedSpoilerText) {
        throw AppError.fromCode(
          'game/scraper/read-spoiler-element-failed',
          page.url(),
          new Error().stack,
        );
      }

      const nestedSpoilerElements = await rootSpoiler.$$(
        NESTED_SPOILER_ELEMENT_SELECTOR,
      );
      if (nestedSpoilerElements.length > 0) {
        return {
          rootSpoiler: nestedSpoilerText,
          nestedSpoilers: await getNestedSpoilers(page, nestedSpoilerElements),
        } as NestedSpoiler;
      }

      return {
        rootSpoiler: nestedSpoilerText,
        nestedSpoilers: [],
      } as NestedSpoiler;
    }),
  );

  return nestedSpoilers;
}

export default async function getSpoilers<T extends boolean>(
  page: Page,
  checkNested: T,
): Promise<Spoiler<T>[]> {
  try {
    const mainElement = await page.$(BASE_ELEMENT_SELECTOR);
    if (!mainElement) {
      throw AppError.fromCode(
        'game/scraper/read-main-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    const spoilerElements = (
      await Promise.all([
        mainElement.$$(SPOILER_ELEMENT_SELECTOR),
        mainElement.$$(DESCRIPTION_SPOILER_ELEMENT_SELECTOR),
        mainElement.$$(DOWNLOADS_SPOILER_ELEMENT_SELECTOR),
      ])
    ).flat();

    if (checkNested) {
      const nestedSpoilers = await getNestedSpoilers(page, spoilerElements);
      return nestedSpoilers as Spoiler<T>[];
    }

    const spoilers = await Promise.all(
      spoilerElements.map(async (el) => {
        const spoilerText = await page.evaluate((_el) => _el?.textContent, el);
        if (!spoilerText) {
          throw AppError.fromCode(
            'game/scraper/read-spoiler-element-failed',
            page.url(),
            new Error().stack,
          );
        }
        return spoilerText;
      }),
    );

    return spoilers as Spoiler<T>[];
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/spoilers-section-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
