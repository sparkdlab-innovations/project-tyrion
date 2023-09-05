import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { addNewGame } from '../services/resolvers/game';

// TODO: Update version - Update game data and all embeds
// TODO: Refresh game - Fetch all data and update all embeds

export const addNewGameFunction = onDocumentCreated(
  {
    document: 'internalTaskQueue/games/new/{taskId}',
    cpu: 'gcf_gen1',
    memory: '512MiB',
    timeoutSeconds: 60,
    maxInstances: 2,
  },
  addNewGame,
);
