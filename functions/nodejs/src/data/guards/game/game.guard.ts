import {
  ExtendedGameType,
  GameLinkType,
  GameType,
} from '../../types/game/game.type';
import { isArrayOfObject, isArrayOfStrings } from '../shared/array.guard';

/**
 * Checks if the provided data is a valid GameLinkType.
 * @param {unknown} gameLink
 * @return {GameLinkType}
 */
export function isGameLink(gameLink: unknown): gameLink is GameLinkType {
  if (typeof gameLink !== 'object' || gameLink === null) {
    return false;
  }

  const { name, size, url, source } = gameLink as GameLinkType;

  if (typeof name !== 'string') {
    return false;
  }

  if (typeof size !== 'string') {
    return false;
  }

  if (typeof url !== 'string') {
    return false;
  }

  if (typeof source !== 'string') {
    return false;
  }

  return true;
}

/**
 * Checks if the provided data is a valid BasicGameType.
 * @param {unknown} game
 * @return {ExtendedGameType}
 */
export function isGame(game: unknown): game is GameType {
  if (typeof game !== 'object' || game === null) {
    return false;
  }

  const {
    id,
    name,
    description,
    pageUrl,
    coverImageUrl,
    galleryImageUrls,
    genres,
    tags,
    status,
    version,
    releaseDate,
    threadUpdated,
    developer,
    engine,
    os,
    languages,
    censored,
  } = game as GameType;

  if (typeof id !== 'string' && typeof id !== 'undefined') {
    return false;
  }

  if (typeof name !== 'string') {
    return false;
  }

  if (typeof description !== 'string') {
    return false;
  }

  if (typeof pageUrl !== 'string') {
    return false;
  }

  if (typeof coverImageUrl !== 'string') {
    return false;
  }

  if (!isArrayOfStrings(galleryImageUrls)) {
    return false;
  }

  if (!isArrayOfStrings(genres)) {
    return false;
  }

  if (!isArrayOfStrings(tags)) {
    return false;
  }

  if (typeof status !== 'number') {
    return false;
  }

  if (typeof version !== 'string') {
    return false;
  }

  if (typeof releaseDate !== 'number') {
    return false;
  }

  if (typeof threadUpdated !== 'number') {
    return false;
  }

  if (typeof developer !== 'string') {
    return false;
  }

  if (typeof engine !== 'string') {
    return false;
  }

  if (!isArrayOfStrings(os)) {
    return false;
  }

  if (!isArrayOfStrings(languages)) {
    return false;
  }

  if (typeof censored !== 'boolean') {
    return false;
  }

  return true;
}

/**
 * Checks if the provided data is a valid GameType.
 * @param {unknown} game
 * @return {ExtendedGameType}
 */
export function isExtendedGame(game: unknown): game is ExtendedGameType {
  if (typeof game !== 'object' || game === null) {
    return false;
  }

  const {
    id,
    name,
    description,
    pageUrl,
    coverImageUrl,
    galleryImageUrls,
    genres,
    tags,
    status,
    version,
    releaseDate,
    threadUpdated,
    developer,
    engine,
    os,
    languages,
    censored,
    developerUrl,
    downloadText,
    downloadLinks,
    otherContent,
  } = game as ExtendedGameType;

  if (typeof id !== 'string' && typeof id !== 'undefined') {
    return false;
  }

  if (typeof name !== 'string') {
    return false;
  }

  if (typeof description !== 'string') {
    return false;
  }

  if (typeof pageUrl !== 'string') {
    return false;
  }

  if (typeof coverImageUrl !== 'string') {
    return false;
  }

  if (!isArrayOfStrings(galleryImageUrls)) {
    return false;
  }

  if (!isArrayOfStrings(genres)) {
    return false;
  }

  if (!isArrayOfStrings(tags)) {
    return false;
  }

  if (typeof status !== 'number') {
    return false;
  }

  if (typeof version !== 'string') {
    return false;
  }

  if (typeof releaseDate !== 'number') {
    return false;
  }

  if (typeof threadUpdated !== 'number') {
    return false;
  }

  if (typeof developer !== 'string') {
    return false;
  }

  if (typeof engine !== 'string') {
    return false;
  }

  if (!isArrayOfStrings(os)) {
    return false;
  }

  if (!isArrayOfStrings(languages)) {
    return false;
  }

  if (typeof censored !== 'boolean') {
    return false;
  }

  if (typeof developerUrl !== 'string') {
    return false;
  }

  if (typeof downloadText !== 'string') {
    return false;
  }

  if (!isArrayOfObject<GameLinkType>(downloadLinks, isGameLink)) {
    return false;
  }

  if (!isArrayOfStrings(otherContent)) {
    return false;
  }

  return true;
}
