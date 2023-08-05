import { GameStatus } from '../../../../../data/types/game';
import { GAMES_MAIN_SOURCE_LINK } from '../../../../../env';
import { AppError } from '../../../../../utils/error';
import { NestedSpoiler } from '../../../../types/gameScraper.types';
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

type GameDataReturnType = {
  name: string;
  tags: string[];
  status: GameStatus;
  version: string;
  developer: string;
  headerGenres: string[];
  coverImage: string;
  description: string;
  threadUpdated: string;
  releaseDate: string;
  censored: boolean;
  os: string[];
  engine: string;
  languages: string[];
  gallery: string[];
};

type ExtendedGameDataReturnType = GameDataReturnType & {
  spoilers: NestedSpoiler[];
  parsedSpoilers: string[];
  downloadsTextContent: string;
};

type GetGameDataReturnType<T> = T extends true
  ? ExtendedGameDataReturnType
  : GameDataReturnType;

export default async function getGameData<T extends boolean>(
  browserSession: BrowserSession,
  threadId: string,
  isAuthenticated: T,
): Promise<GetGameDataReturnType<T>> {
  try {
    const { page } = browserSession;
    await page.goto(
      `https://${GAMES_MAIN_SOURCE_LINK.value()}/threads/${threadId}`,
    );

    // Title
    const title = await page.title();
    checkErrorPage(title);
    const {
      name,
      tags,
      engine,
      status,
      version: titleVersion,
      developer: titleDeveloper,
    } = parseTitle(title);

    // Header
    const { genres: headerGenres, coverImage } = await getHeaderSection(
      page,
      isAuthenticated,
    );

    // Blocked Or Spoilers
    const { blockedLinkTexts, blockedSpoilerTexts } = !isAuthenticated
      ? await getBlockedSections(page)
      : { blockedLinkTexts: undefined, blockedSpoilerTexts: undefined };

    const spoilers = isAuthenticated
      ? await getSpoilers(page, true)
      : undefined;
    const parsedSpoilers = spoilers
      ? await parseSpoilers(spoilers, page.url())
      : undefined;

    // Description
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

    // Information
    const mainTextContent = await getMainSection(page);
    const downloadsTextContent = await getDownloadSection(page, false);

    const {
      threadUpdated,
      releaseDate,
      developer,
      version,
      censored,
      os,
      language: languages,
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

    // Gallery
    const gallery = await getGallerySection(page);

    const _rawGameData: GameDataReturnType = {
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
      engine,
      languages,
      gallery,
    };

    if (!isAuthenticated) {
      return _rawGameData as GetGameDataReturnType<T>;
    }

    return {
      ..._rawGameData,
      spoilers,
      parsedSpoilers,
      downloadsTextContent,
    } as GetGameDataReturnType<T>;
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/game-data-unknown-error',
      error,
      threadId,
      new Error().stack,
    );
  }
}
