const EXPORTED_SYMBOLS = ['sanitizeString'];

/**
 * Removes all control characters from the string.
 *
 * @param {string?} string
 *
 * @returns {string|undefined}
 */
function sanitizeString (string) {
  return string?.replace(/[\u0000-\u001F\u007F-\u009F]/g, '');
}
