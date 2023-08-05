import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { addNewGame } from '../services/resolvers/game';

// TODO: Update version - Update game data and all embeds
// TODO: Refresh game - Fetch all data and update all embeds

export const addNewGameFunction = onDocumentCreated(
  'internalTaskQueue/games/new/{taskId}',
  addNewGame,
);
