/**
 * Checks if the value is an array of the provided type.
 * @param {unknown} value
 * @param {Function} typeGuard
 * @return {T[]}
 */
export function isArrayOfObject<T>(
  value: unknown,
  typeGuard: (value: unknown) => boolean,
): value is T[] {
  return Array.isArray(value) && value.every(typeGuard);
}

/**
 * Checks if the value is an array of strings.
 * @param {unknown} value
 * @return {string[]}
 */
export function isArrayOfStrings(value: unknown): value is string[] {
  return isArrayOfObject<string>(value, (val) => typeof val === 'string');
}
