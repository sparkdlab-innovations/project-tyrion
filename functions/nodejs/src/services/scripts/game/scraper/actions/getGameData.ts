import { GAMES_MAIN_SOURCE_LINK } from '../../../../../env';
import { AppError } from '../../../../../utils/error';
import { BrowserSession } from '../../../../types/puppeteer.types';
import {
  parseDescription,
  parseInformation,
  parseSpoilers,
  parseTitle,
} from '../parsers';
import {
  getBlockedSections,
  getDescriptionSection,
  getDownloadSection,
  getGallerySection,
  getHeaderSection,
  getMainSection,
  getSpoilers,
} from '../sections';
import checkErrorPage from './checkErrorPage';

export default async function getGameData(
  browserSession: BrowserSession,
  threadId: string,
  isAuthenticated: boolean,
) {
  try {
    console.time(`getGameData | ${threadId}`);

    const { page } = browserSession;
    console.time(`getGameData | ${threadId} | navigate`);
    await page.goto(
      `https://${GAMES_MAIN_SOURCE_LINK.value()}/threads/${threadId}`,
    );
    console.timeEnd(`getGameData | ${threadId} | navigate`);

    // Title
    console.time(`getGameData | ${threadId} | title`);
    const title = await page.title();
    checkErrorPage(title);
    const {
      name,
      tags,
      status,
      version: titleVersion,
      developer: titleDeveloper,
    } = parseTitle(title);
    console.timeEnd(`getGameData | ${threadId} | title`);

    // Header
    console.time(`getGameData | ${threadId} | header`);
    const { genres: headerGenres, coverImage } = await getHeaderSection(
      page,
      isAuthenticated,
    );
    console.timeEnd(`getGameData | ${threadId} | header`);

    // Blocked Or Spoilers
    console.time(`getGameData | ${threadId} | blocked`);
    const { blockedLinkTexts, blockedSpoilerTexts } = !isAuthenticated
      ? await getBlockedSections(page)
      : { blockedLinkTexts: undefined, blockedSpoilerTexts: undefined };
    console.timeEnd(`getGameData | ${threadId} | blocked`);

    console.time(`getGameData | ${threadId} | spoilers`);
    const spoilers = isAuthenticated
      ? await getSpoilers(page, true)
      : undefined;
    const parsedSpoilers = spoilers
      ? await parseSpoilers(spoilers, page.url())
      : undefined;
    console.timeEnd(`getGameData | ${threadId} | spoilers`);

    // Description
    console.time(`getGameData | ${threadId} | description`);
    const descriptionTextContent = await getDescriptionSection(page);
    const description = parseDescription(
      page.url(),
      descriptionTextContent,
      blockedLinkTexts,
      blockedSpoilerTexts,
      spoilers?.map((spoiler) => spoiler.rootSpoiler),
      parsedSpoilers,
      isAuthenticated,
    );
    console.timeEnd(`getGameData | ${threadId} | description`);

    // Information
    console.time(`getGameData | ${threadId} | information`);
    const mainTextContent = await getMainSection(page);
    const downloadsTextContent = await getDownloadSection(page, false);

    const {
      threadUpdated,
      releaseDate,
      developer,
      version,
      censored,
      os,
      language,
    } = await parseInformation(
      page.url(),
      mainTextContent,
      descriptionTextContent,
      downloadsTextContent,
      blockedLinkTexts,
      blockedSpoilerTexts,
      spoilers?.map((spoiler) => spoiler.rootSpoiler),
      parsedSpoilers,
      isAuthenticated,
    );
    console.timeEnd(`getGameData | ${threadId} | information`);

    // Gallery
    console.time(`getGameData | ${threadId} | gallery`);
    const gallery = await getGallerySection(page);
    console.timeEnd(`getGameData | ${threadId} | gallery`);

    console.timeEnd(`getGameData | ${threadId}`);
    return {
      name,
      tags,
      status,
      version: titleVersion === '' ? titleVersion : version,
      developer: titleDeveloper === '' ? titleDeveloper : developer,
      headerGenres,
      coverImage,
      description,
      threadUpdated,
      releaseDate,
      censored,
      os,
      language,
      gallery,
      spoilers,
      parsedSpoilers,
      downloadsTextContent,
    };
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/game-data-unknown-error',
      error,
      threadId,
      new Error().stack,
    );
  }
}
