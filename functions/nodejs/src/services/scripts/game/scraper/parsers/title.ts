import { GameStatus } from '../../../../../data/types/game/gameStatus.enum';
import { AppError } from '../../../../../utils/error';
import {
  ENGINE_VALUES,
  STATUS_VALUES,
  TAG_VALUES,
  TITLE_REGEX,
} from './constants';

export default function parseTitle(title: string): {
  name: string;
  tags: string[];
  engine: string;
  status: GameStatus;
  version: string;
  developer: string;
} {
  try {
    const matches = title.match(TITLE_REGEX);

    if (!matches || matches.length !== 4) {
      throw AppError.fromCode(
        'game/scraper/title-format-mismatch',
        title,
        new Error().stack,
      );
    }

    const tags = matches[1]
      .split(' - ')
      .filter((val) => TAG_VALUES.includes(val))
      .map((val) => val?.trim());

    const engine = tags.filter((val) => ENGINE_VALUES.includes(val))[0];

    const status = matches[1]
      .split(' - ')
      .filter((val) => STATUS_VALUES.includes(val))[0]
      ?.trim();

    const [version, developer] = matches[3]
      .split('[')
      .map((val) => val?.toString()?.trim())
      .filter((val) => val && val !== '')
      .map((val) => val?.split(']')[0]?.toString()?.trim());

    if (!version || !developer) {
      throw AppError.fromCode(
        'game/scraper/title-format-mismatch',
        title,
        new Error().stack,
      );
    }

    if (status === 'Completed') {
      return {
        tags,
        engine,
        status: GameStatus.completed,
        name: matches[2].trim(),
        version,
        developer,
      };
    } else if (status === 'Onhold') {
      return {
        tags,
        engine,
        status: GameStatus.onHold,
        name: matches[2].trim(),
        version,
        developer,
      };
    } else if (status === 'Abandoned') {
      return {
        tags,
        engine,
        status: GameStatus.abandoned,
        name: matches[2].trim(),
        version,
        developer,
      };
    } else if (status === 'Demo') {
      return {
        tags,
        engine,
        status: GameStatus.demo,
        name: matches[2].trim(),
        version,
        developer,
      };
    } else {
      return {
        tags,
        engine,
        status: GameStatus.ongoing,
        name: matches[2].trim(),
        version,
        developer,
      };
    }
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'game/scraper/parse-title-failed',
      error,
      title,
      new Error().stack,
    );
  }
}
