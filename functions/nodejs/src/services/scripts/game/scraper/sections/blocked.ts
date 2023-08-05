import { ElementHandle, Page } from 'puppeteer';
import { AppError } from '../../../../../utils/error';
import {
  BASE_ELEMENT_SELECTOR,
  BLOCKED_LINK_ELEMENT_SELECTOR,
  DESCRIPTION_BLOCKED_LINK_ELEMENT_SELECTOR,
  DESCRIPTION_SPOILER_ELEMENT_SELECTOR,
  DOWNLOADS_BLOCKED_LINK_ELEMENT_SELECTOR,
  DOWNLOADS_SPOILER_ELEMENT_SELECTOR,
  SPOILER_ELEMENT_SELECTOR,
} from './cssSelectors';

async function getBlockedLinkSection(
  page: Page,
  mainElement: ElementHandle<HTMLDivElement>,
): Promise<string[]> {
  const blockedLinkElement = (
    await Promise.all([
      mainElement.$$(BLOCKED_LINK_ELEMENT_SELECTOR),
      mainElement.$$(DESCRIPTION_BLOCKED_LINK_ELEMENT_SELECTOR),
      mainElement.$$(DOWNLOADS_BLOCKED_LINK_ELEMENT_SELECTOR),
    ])
  ).flat();
  const blockedLinkTexts = await Promise.all(
    blockedLinkElement.map(async (el) => {
      const text = await page.evaluate((_el) => _el?.textContent, el);
      return text?.trim() ?? '';
    }),
  );
  return blockedLinkTexts;
}

async function getBlockedSpoilerSection(
  page: Page,
  mainElement: ElementHandle<HTMLDivElement>,
): Promise<string[]> {
  const blockedSpoilerElement = (
    await Promise.all([
      mainElement.$$(SPOILER_ELEMENT_SELECTOR),
      mainElement.$$(DESCRIPTION_SPOILER_ELEMENT_SELECTOR),
      mainElement.$$(DOWNLOADS_SPOILER_ELEMENT_SELECTOR),
    ])
  ).flat();
  const blockedSpoilerTexts = await Promise.all(
    blockedSpoilerElement.map(async (el) => {
      const text = await page.evaluate((_el) => _el?.textContent, el);
      return text?.trim() ?? '';
    }),
  );
  return blockedSpoilerTexts;
}

export default async function getBlockedSections(page: Page): Promise<{
  blockedLinkTexts: string[];
  blockedSpoilerTexts: string[];
}> {
  try {
    const mainElement = await page.$(BASE_ELEMENT_SELECTOR);
    if (!mainElement) {
      throw AppError.fromCode(
        'game/scraper/read-main-element-failed',
        page.url(),
        new Error().stack,
      );
    }

    const [blockedLinkTexts, blockedSpoilerTexts] = await Promise.all([
      getBlockedLinkSection(page, mainElement),
      getBlockedSpoilerSection(page, mainElement),
    ]);

    return {
      blockedLinkTexts,
      blockedSpoilerTexts,
    };
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/blocked-sections-unknown-error',
      error,
      page.url(),
      new Error().stack,
    );
  }
}
