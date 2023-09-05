import { GameStatus } from './gameStatus.enum';

type GameEmbedBaseType = {
  id: string;
  name: string;
  coverImageUrl: string;
  status: GameStatus;
  version: string;
};

export type UserLibraryGameEmbedType = GameEmbedBaseType & {
  isPinned: boolean;
  lastDownloadedVersion?: string;
  lastDownloadedDate?: number;
  reccomendationScore?: never;
};

export type UserRecommendationGameEmbedType = GameEmbedBaseType & {
  reccomendationScore: number;
  isPinned?: never;
  lastDownloadedVersion?: never;
  lastDownloadedDate?: never;
};

export type GameEmbedType =
  | UserLibraryGameEmbedType
  | UserRecommendationGameEmbedType;
