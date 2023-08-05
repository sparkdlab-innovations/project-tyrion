// GENERAL
export const MULTIPLE_SPACES_REGEX = new RegExp(/(\s){2,}/gim);
export const MULTIPLE_BREAKS_REGEX = new RegExp(/(\\\S|\t|\n){2,}/gim);
export const START_OR_END_TRIM_REGEX = new RegExp(
  /(^(\n|\t|\\\S|\s)+)|((\n|\t|\\\S|\s)+$)/gis,
);

// TITLE
export const TITLE_REGEX = new RegExp(
  /^((?:\b\S+?\b\s-\s\b)+)?(.+?)((?:\s\[.+?\])+)(?:.+?)$/,
);
export const TAG_VALUES = ['VN', 'Others', 'Unity', 'HTML', "Ren'Py", 'RPGM'];
export const STATUS_VALUES = [
  'Completed',
  'Onhold',
  'Abandoned',
  'Ongoing',
  'Demo',
];

// SPOILER
export const SPOILER_REGEX = new RegExp(
  /^(?:\n|\t|\\\S|\s)*(?:spoiler(?::?\s?more)?)(?:\n|\t|\\\S|\s)*(.+)(?:\n|\t|\\\S|\s)+$/gis,
);

// DESCRIPTION
export const DESCRIPTION_REGEX = new RegExp(
  /^(?:(?:\\\S)|(?:<.+\/?>)|(?:overview\s*?:?\s*?)|\s)+/i,
);

// INFORMATION
export const BASIC_INFORMATION_REGEX = new RegExp(
  /(?:\n|\t|\\\S)*([\sa-zA-Z0-9]+?)(?:\s?:\s?)(.+?)(?:\n|\t|\\\S)+/gim,
);
