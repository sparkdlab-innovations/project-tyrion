import IKResponse from 'imagekit/dist/libs/interfaces/IKResponse';

export default function isImagekitResponse(error: unknown): error is IKResponse<
  | {
      message?: string;
      help?: string;
    }
  | unknown
> {
  return (
    typeof error === 'object' &&
    error !== null &&
    typeof (error as IKResponse<unknown>).$ResponseMetadata === 'object' &&
    (error as IKResponse<unknown>).$ResponseMetadata !== null &&
    typeof (error as IKResponse<unknown>).$ResponseMetadata.statusCode ===
      'number' &&
    (error as IKResponse<unknown>).$ResponseMetadata.statusCode >= 200 &&
    (error as IKResponse<unknown>).$ResponseMetadata.statusCode < 600
  );
}
