import { GameEmbedType } from '../game/gameEmbed.type';
import { MediaType } from '../shared';

export type UserInterface = {
  id?: string;
  firstName: string;
  lastName: string;
  email: string;
  picture: MediaType;

  gameLibrary: GameEmbedType[];
};

export type BasicUserInterface = Pick<
  UserInterface,
  'id' | 'firstName' | 'lastName' | 'email' | 'picture'
>;
