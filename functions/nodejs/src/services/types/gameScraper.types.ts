export type NestedSpoiler = {
  rootSpoiler: string;
  nestedSpoilers: NestedSpoiler[];
};

export type Spoiler<T> = T extends true ? NestedSpoiler : string;
