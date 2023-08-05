import { AppError } from '../../../../../utils/error';
import {
  DESCRIPTION_REGEX,
  MULTIPLE_BREAKS_REGEX,
  MULTIPLE_SPACES_REGEX,
} from './constants';

export default function parseDescription(
  pageUrl: string,
  sectionText: string,
  blockedLinkTexts?: string[],
  blockedSpoilerTexts?: string[],
  spoilers?: string[],
  parsedSpoilers?: string[],
  isAuthenticated?: boolean,
): string {
  try {
    sectionText = sectionText
      .toString()
      .trim()
      .replace(DESCRIPTION_REGEX, '')
      .trim();

    if (!isAuthenticated && blockedLinkTexts) {
      blockedLinkTexts.forEach((blockedLinkText) => {
        sectionText = sectionText
          .replace(new RegExp(blockedLinkText, 'g'), '')
          .trim();
      });
    }
    if (!isAuthenticated && blockedSpoilerTexts) {
      blockedSpoilerTexts.forEach((blockedSpoilerText) => {
        sectionText = sectionText
          .replace(new RegExp(blockedSpoilerText, 'g'), '')
          .trim();
      });
    }

    if (isAuthenticated && spoilers && parsedSpoilers) {
      spoilers.forEach((spoiler, index) => {
        sectionText = sectionText.replace(
          spoiler.replace(/^(\t|\n)*/g, '').replace(/(\t|\n)*$/g, ''),
          parsedSpoilers[index],
        );
      });
    }

    return sectionText
      .replace(MULTIPLE_SPACES_REGEX, '')
      .replace(MULTIPLE_BREAKS_REGEX, '')
      .trim();
  } catch (error) {
    throw AppError.fromCode(
      'game/scraper/parse-description-failed',
      pageUrl,
      new Error().stack,
    );
  }
}
