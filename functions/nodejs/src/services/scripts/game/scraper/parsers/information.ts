import { AppError } from '../../../../../utils/error';
import { BASIC_INFORMATION_REGEX } from './constants';

export default async function parseInformation(
  pageUrl: string,
  mainTextContent: string,
  descriptionTextContent: string,
  downloadsTextContent: string,
  blockedLinkTexts?: string[],
  blockedSpoilerTexts?: string[],
  spoilers?: string[],
  parsedSpoilers?: string[],
  isAuthenticated?: boolean,
): Promise<{
  threadUpdated: string;
  releaseDate: string;
  developer: string;
  version: string;
  censored: boolean;
  os: string[];
  language: string[];
}> {
  try {
    let informationTextContent = mainTextContent
      .replace(descriptionTextContent, '')
      .replace(downloadsTextContent, '')
      .trim();

    if (!isAuthenticated && blockedLinkTexts) {
      blockedLinkTexts.forEach((blockedLinkText) => {
        informationTextContent = informationTextContent
          .replace(new RegExp(blockedLinkText, 'g'), '')
          .trim();
      });
    }
    if (!isAuthenticated && blockedSpoilerTexts) {
      blockedSpoilerTexts.forEach((blockedSpoilerText) => {
        informationTextContent = informationTextContent
          .replace(new RegExp(blockedSpoilerText, 'g'), '')
          .trim();
      });
    }

    if (!isAuthenticated && spoilers && parsedSpoilers) {
      spoilers.forEach((spoiler, index) => {
        informationTextContent = informationTextContent.replace(
          new RegExp(spoiler, 'g'),
          parsedSpoilers[index],
        );
      });
    }

    const information = [
      ...informationTextContent.matchAll(BASIC_INFORMATION_REGEX),
    ];

    if (information.length <= 0) {
      throw new AppError(
        'game/scraper',
        'parse-information-failed',
        400,
        'Failed to parse information',
        1,
        pageUrl,
        new Error().stack,
      );
    }

    const threadUpdated = information
      .filter((info) => info[1].match(new RegExp('Thread Updated', 'i')))[0][2]
      .trim();

    const releaseDate = information
      .filter((info) => info[1].match(new RegExp('Release Date', 'i')))[0][2]
      .trim();

    const developer = information
      .filter((info) => info[1].match(new RegExp('Developer', 'i')))[0][2]
      .replace(new RegExp(/((\\\S|\n|\t|\s|-).+?)?(\\\S|\n|\t|\s|-)*$/gim), '')
      .trim();

    const version = information
      .filter((info) => info[1].match(new RegExp('Version', 'i')))[0][2]
      .trim();

    const censored =
      information
        .filter(
          (info) =>
            info[1].match(new RegExp('Censored', 'i')) ||
            info[1].match(new RegExp('Censorship', 'i')),
        )[0][2]
        .match(new RegExp('yes', 'i')) !== null
        ? true
        : false;

    const os = information
      .filter((info) => info[1].match(new RegExp('OS', 'i')))[0][2]
      .split(',')
      .map((os) => os.trim())
      .filter((os) => os && os !== '');

    const language = information
      .filter((info) => info[1].match(new RegExp('Language', 'i')))[0][2]
      .split(new RegExp(/(,|-)/))
      .map((language) => language.trim())
      .filter(
        (language) => language && new RegExp(/(,|-)/).test(language) === false,
      );

    return {
      threadUpdated,
      releaseDate,
      developer,
      version,
      censored,
      os,
      language,
    };
  } catch (error) {
    if (error instanceof AppError) {
      throw error;
    }
    throw new AppError(
      'game/scraper',
      'parse-information-failed',
      400,
      'Failed to parse information',
      1,
      pageUrl,
      new Error().stack,
    );
  }
}
