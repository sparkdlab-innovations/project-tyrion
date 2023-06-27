import {
  // defineBoolean,
  // defineInt,
  // defineList,
  defineString,
} from 'firebase-functions/params';

export const NODE_ENV = defineString('NODE_ENV', {
  default: 'development',
  description: 'The environment in which the funtion is running.',
  input: {
    select: {
      options: [
        {
          value: 'development',
          label: 'Local Development',
        },
        {
          value: 'staging',
          label: 'Firebase Staging',
        },
        {
          value: 'production',
          label: 'Firebase Production',
        },
      ],
    },
  },
});
