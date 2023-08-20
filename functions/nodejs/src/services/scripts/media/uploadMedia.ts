import { MediaType } from '../../../data/types/shared';
import { AppError } from '../../../utils/error';
import getImagekit from './getImagekit';

export default async function uploadMedia(
  fileData: string | Buffer,
  fileName: string,
  fileDataType: 'url' | 'base64' | 'buffer' = 'url',
  filePath: string = '/',
  customTags?: string[],
  overwrite?: boolean,
  isPrivate?: boolean,
): Promise<MediaType> {
  try {
    if (
      fileDataType === 'url' &&
      (typeof fileData !== 'string' || !fileData.startsWith(`https://`))
    ) {
      throw AppError.fromCode(
        'media/imagekit/invalid-url',
        `${filePath}/${fileName} | ${fileDataType}`,
        new Error().stack,
      );
    }
    if (
      fileDataType === 'base64' &&
      (typeof fileData !== 'string' || !fileData.startsWith('data:'))
    ) {
      throw AppError.fromCode(
        'media/imagekit/invalid-base64',
        `${filePath}/${fileName} | ${fileDataType}`,
        new Error().stack,
      );
    }
    if (fileDataType === 'buffer' && !(fileData instanceof Buffer)) {
      throw AppError.fromCode(
        'media/imagekit/invalid-buffer',
        `${filePath}/${fileName} | ${fileDataType}`,
        new Error().stack,
      );
    }

    const result = await getImagekit().upload({
      file: fileData,
      fileName,
      folder: filePath,
      tags: [
        ...filePath
          .split('/')
          .filter((path) => path && path !== '')
          .slice(1),
        fileName,
        ...(isPrivate ? ['isPrivate'] : []),
        ...(fileDataType === 'url' ? [fileData as string] : []),
        `uploadedAt: ${Date.now()}`,
        ...(customTags || []),
      ],
      isPrivateFile: isPrivate,
      overwriteFile: overwrite,
      overwriteTags: overwrite,
    });

    return {
      fileId: result.fileId,
      url: result.url,
      thumbnailUrl: result.thumbnailUrl,
    };
  } catch (error) {
    throw AppError.fromErrorOrCode(
      'media/imagekit/unknown-upload-error',
      error,
      `${filePath}/${fileName} | ${fileDataType}`,
      new Error().stack,
    );
  }
}
