import AppError from '../../../../../utils/error/appError';
import { BrowserSession } from '../../../../types/puppeteer.types';

export async function parseDeveloper(
  broswerSession: BrowserSession,
  configSection: string,
): Promise<{
  name: string;
  link: string;
}> {
  try {
    const name = configSection
      ?.split(/\bdeveloper\b\s?\/?\s?(\bpublisher\b)?\s?:?/i)[2]
      ?.toString()
      ?.trim()
      ?.split(/\bpatreon\b/i)[0]
      ?.toString()
      ?.trim()
      ?.split(/\bf95(zone)?\b/i)[0]
      ?.toString()
      ?.trim()
      ?.split(/\bsubscribe(\b\s\b)?star\b/i)[0]
      ?.toString()
      ?.trim()
      ?.split('-')[0]
      ?.toString()
      ?.trim()
      ?.split(/\bcensored\b/i)[0]
      ?.toString()
      ?.trim()
      ?.split(/\bversion\b/i)[0]
      ?.toString()
      ?.trim();

    const devPatreonElem = await broswerSession.page.$(
      'article.message-body > * > a.link[href^="https://www.patreon.com/"]',
    );

    if (!devPatreonElem) {
      return { name, link: '' };
    }

    const link = await broswerSession.page.evaluate(
      (el) => el?.href,
      devPatreonElem,
    );

    return { name, link };
  } catch (error) {
    throw new AppError(
      'game/scraper',
      'parse-developer-failed',
      400,
      'Failed to parse developer',
      1,
      undefined,
      new Error().stack,
    );
  }
}
