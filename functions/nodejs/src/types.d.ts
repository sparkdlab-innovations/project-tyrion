export {};

declare global {
  type AtLeast<T, K extends T> = Partial<K> & Pick<K, keyof T>;
}
