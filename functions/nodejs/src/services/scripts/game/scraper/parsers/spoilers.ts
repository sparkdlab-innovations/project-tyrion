// import { NestedSpoiler } from '../../../../../types/gameScraper.types';
import { isArrayOfStrings } from '../../../../../data/guards/shared/array.guard';
import { AppError } from '../../../../../utils/error';
import { NestedSpoiler } from '../../../../types/gameScraper.types';
import {
  MULTIPLE_BREAKS_REGEX,
  MULTIPLE_SPACES_REGEX,
  SPOILER_REGEX,
} from './constants';

async function parseNestedSpoilers(
  spoilers: NestedSpoiler[],
  pageUrl: string,
): Promise<string[]> {
  return Promise.all(
    spoilers.map(async (spoiler) => {
      let parsedRootSpoiler = spoiler.rootSpoiler;

      if (spoiler.nestedSpoilers.length > 0) {
        const parsedNestedSpoilers = await parseNestedSpoilers(
          spoiler.nestedSpoilers,
          pageUrl,
        );
        parsedNestedSpoilers.forEach((parsedNestedSpoiler, index) => {
          parsedRootSpoiler = parsedRootSpoiler.replace(
            spoiler.nestedSpoilers[index].rootSpoiler,
            parsedNestedSpoiler,
          );
        });
      }

      parsedRootSpoiler = (
        await parseSpoilers([parsedRootSpoiler], pageUrl)
      )[0];

      return parsedRootSpoiler;
    }),
  );
}

export default async function parseSpoilers(
  spoilers: string[] | NestedSpoiler[],
  pageUrl: string,
): Promise<string[]> {
  try {
    return Promise.race([
      isArrayOfStrings(spoilers)
        ? new Promise<string[]>((resolve, reject) => {
            const parsedSpoilers = spoilers.map<string>((spoiler) => {
              if (spoiler.length > 5000) {
                return '';
              }
              const spoilerMatch = [...spoiler.matchAll(SPOILER_REGEX)];
              if (spoilerMatch.length <= 0 || spoilerMatch[0].length <= 1) {
                reject(
                  AppError.fromCode(
                    'game/scraper/spoiler-format-mismatch',
                    pageUrl,
                    new Error().stack,
                  ),
                );
                return '';
              }
              return `<--spoiler-->${spoilerMatch[0][1].replace(
                /:/g,
                '-',
              )}</--spoiler-->`;
            });
            resolve(
              parsedSpoilers.map((parsedSpoiler) =>
                parsedSpoiler
                  .replace(MULTIPLE_SPACES_REGEX, ' ')
                  .replace(MULTIPLE_BREAKS_REGEX, '\n'),
              ),
            );
          })
        : parseNestedSpoilers(spoilers, pageUrl).then((parsedSpoilers) =>
            parsedSpoilers.map((parsedSpoiler) =>
              parsedSpoiler
                .replace(MULTIPLE_SPACES_REGEX, ' ')
                .replace(MULTIPLE_BREAKS_REGEX, '\n'),
            ),
          ),
      new Promise<string[]>((_, reject) =>
        setTimeout(
          () => {
            reject(
              AppError.fromCode(
                'game/scraper/parse-spoilers-timeout',
                pageUrl,
                new Error().stack,
              ),
            );
          },
          isArrayOfStrings(spoilers) ? 1000 * 1 : 1000 * 5,
        ),
      ),
    ]);
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/parse-spoilers-unknown-error',
      error,
      pageUrl,
      new Error().stack,
    );
  }
}
