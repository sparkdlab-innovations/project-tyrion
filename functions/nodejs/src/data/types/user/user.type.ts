import { GameEmbedType } from '../game/gameEmbed.type';
import { MediaType } from '../shared';
import { UserAccessInterface } from './userAccess.type';

export type UserInterface = {
  id?: string;
  firstName: string;
  lastName: string;
  email: string;
  picture: MediaType;

  access: UserAccessInterface;

  gameLibrary: GameEmbedType[];
};

export type BasicUserInterface = Pick<
  UserInterface,
  'id' | 'firstName' | 'lastName' | 'email' | 'picture' | 'access'
>;
