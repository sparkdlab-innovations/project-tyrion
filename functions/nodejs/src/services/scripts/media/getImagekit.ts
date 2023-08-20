import ImageKit from 'imagekit';
import {
  IMAGEKIT_PRIVATE_KEY,
  IMAGEKIT_PUBLIC_KEY,
  IMAGEKIT_URL_ENDPOINT,
} from '../../../env';

export default function imagekit(): ImageKit {
  const _imagekit = new ImageKit({
    publicKey: IMAGEKIT_PUBLIC_KEY.value(),
    privateKey: IMAGEKIT_PRIVATE_KEY.value(),
    urlEndpoint: IMAGEKIT_URL_ENDPOINT.value(),
  });
  return _imagekit;
}
