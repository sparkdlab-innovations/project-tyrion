import { AppSegment } from '../shared/appSegment.enum';
import { UserRole } from './userRole.enum';

type EnabledSegmentAccessInterface = (
  | {
      role: UserRole;
      level?: never;
      isLocal?: false;
    }
  | {
      role?: never;
      level: number;
      isLocal?: false;
    }
  | {
      role?: never;
      level?: never;
      isLocal: true;
    }
) & {
  enabled: true;
};

type DisabledSegmentAccessInterface = {
  enabled: false;
};

type SegmentAccessInterface =
  | EnabledSegmentAccessInterface
  | DisabledSegmentAccessInterface;

export type UserAccessInterface = {
  segments: {
    [key in AppSegment]: SegmentAccessInterface;
  };
};
