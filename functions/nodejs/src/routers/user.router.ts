import {
  beforeUserCreated,
  beforeUserSignedIn,
} from 'firebase-functions/v2/identity';
import { addNewUser, signInUser } from '../services/resolvers/user';

export const addNewUserFunction = beforeUserCreated(
  {
    cpu: 'gcf_gen1',
    memory: '128MiB',
    timeoutSeconds: 5,
  },
  addNewUser,
);
