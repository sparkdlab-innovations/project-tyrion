import { GameStatus } from './gameStatus.enum';

export type GameLinkType = {
  name: string;
  size: string;
  url: string;
  source: string;
};

export type BasicGameType = {
  id?: string;
  name: string;
  title: string;
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
};

export type GameType = BasicGameType & {
  developer: string;
  developerUrl: string;
  engine: string;
  os: string[];
  languages: string[];
  downloadText: string;
  downloadLinks: GameLinkType[];
};
