import { GameStatus } from './gameStatus.enum';

export type GameLinkType = {
  name: string;
  size: string;
  url: string;
  source: string;
};

export type GameType = {
  id?: string;
  name: string;
  description: string;
  pageUrl: string;
  coverImageUrl: string;
  galleryImageUrls: string[];
  genres: string[];
  tags: string[];
  status: GameStatus;
  version: string;
  releaseDate: number;
  threadUpdated: number;
  developer: string;
  engine: string;
  os: string[];
  languages: string[];
  censored: boolean;
};

export type ExtendedGameType = GameType & {
  developerUrl: string;
  downloadText: string;
  downloadLinks: GameLinkType[];
  otherContent: string[];
};
