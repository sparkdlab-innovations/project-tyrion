import { BeforeCreateResponse } from 'firebase-functions/lib/common/providers/identity';
import { AuthBlockingEvent } from 'firebase-functions/v2/identity';
import { createUserRecord } from '../../../data/sources/user';
import {
  BasicUserInterface,
  UserAccessInterface,
} from '../../../data/types/user';
import { AppError } from '../../../utils/error';
import { uploadMedia } from '../../scripts/media';

function parseDisplayName(displayName: string): {
  firstName: string;
  lastName: string;
} {
  const _parts = displayName.split(' ').filter((part) => part && part !== '');

  if (_parts.length < 2) {
    return {
      firstName: '',
      lastName: _parts[0] ?? '',
    };
  }
  if (_parts.length === 2) {
    return {
      firstName: _parts[0],
      lastName: _parts[1],
    };
  }
  if ((_parts.at(-1) ?? '').length > 2) {
    return {
      firstName: _parts.slice(0, -1).join(' '),
      lastName: _parts.at(-1) ?? '',
    };
  }
  return {
    firstName: _parts[0],
    lastName: _parts.slice(1).join(' '),
  };
}

export default async function addNewUser(
  event: AuthBlockingEvent,
): Promise<BeforeCreateResponse> {
  try {
    const profile = await uploadMedia(
      event.additionalUserInfo?.profile?.photoURL,
      event.data.uid,
      'url',
      'users/profile',
      undefined,
      true,
      true,
    );

    const _userAccess: UserAccessInterface = {
      segments: {
        games: {
          enabled: false,
        },
        stocks: {
          enabled: false,
        },
        schedule: {
          enabled: true,
          isLocal: true,
        },
      },
    };

    const _userProfile: BasicUserInterface = {
      ...parseDisplayName(event.data.displayName ?? ''),
      email: event.data.email ?? '',
      picture: profile,
    };

    await createUserRecord(event.data.uid, _userProfile);

    return {
      emailVerified: true,
      customClaims: _userAccess,
      disabled: false,
      displayName: event.data.displayName,
      photoURL: profile.url,
    };
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'user/resolver/unknown-error',
      error,
      `${event.data.uid}`,
      new Error().stack,
    );
  }
}
