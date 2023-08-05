import moment from 'moment';

/**
 * Log Class
 * @class Log
 * @export
 * @param {string} module
 * @return {Log}
 */
export default class Log {
  public module: string;

  /**
   * Constructor
   * @constructor
   * @param {string} module
   */
  constructor(module: string) {
    this.module = module;
  }

  /**
   * Current Time Function
   * @description Returns the current time in the format DD-MM-YYYY hh:mm:ss A z
   * @return {string}
   * @memberof Log
   * @method currentTime
   * @private
   */
  private currentTime(): string {
    // Create a moment object.
    const now = moment();
    // Set the time zone to local time zone.
    now.local();
    // Format the date to the desired format.
    return now.format('DD-MM-YYYY hh:mm:ss A z');
  }

  /**
   * Debug Log
   * @description
   * Logs the message to the console with the
   * current time, module name and the message
   * as well as the data and stack trace if provided.
   * @param {string} message
   * @param {string | undefined} data
   * @param {string | undefined} stackTrace
   * @return {void}
   * @memberof Log
   * @method error
   * @instance
   */
  debug(
    message: string,
    data: string | undefined,
    stackTrace: string | undefined,
  ): void {
    // Get the current time
    const now = this.currentTime();

    // Print the message
    console.debug(`${now} | ${this.module} | DEBUG | ${message}`);

    // Print the data and stack trace, if available
    if (data) {
      // Group the data for better readability
      console.group(`${now} | ${this.module} | DEBUG DATA`);
      console.debug(data);
      console.debug(stackTrace);
      console.groupEnd();
    }
  }

  /**
   * Verbose Log
   * @description
   * Logs the message to the console with the
   * current time, module name and the message
   * as well as the data if provided.
   * @param {string} message
   * @param {string | undefined} data
   * @return {void}
   * @memberof Log
   * @method error
   * @instance
   */
  verbose(message: string, data: string | undefined): void {
    // Get the current time
    const now = this.currentTime();

    // Print the message
    console.log(`${now} | ${this.module} | VERBOSE | ${message}`);

    // Print the data, if available
    if (data) {
      // Group the data for better readability
      console.group(`${now} | ${this.module} | VERBOSE DATA`);
      console.log(data);
      console.groupEnd();
    }
  }

  /**
   * Info Log
   * @description
   * Logs the message to the console with the
   * current time, module name and the message.
   * @param {string} message
   * @return {void}
   * @memberof Log
   * @method error
   * @instance
   */
  info(message: string): void {
    // Print the message
    console.info(`${this.currentTime()} | ${this.module} | INFO | ${message}`);
  }

  /**
   * Warning Log
   * @description
   * Logs the message to the console with the
   * current time, module name and the message.
   * @param {string} message
   * @return {void}
   * @memberof Log
   * @method error
   * @instance
   */
  warn(message: string): void {
    // Print the message
    console.warn(`${this.currentTime()} | ${this.module} | WARN | ${message}`);
  }

  /**
   * Error Log
   * @description
   * Logs the message to the console with the
   * current time, module name and the message
   * as well as the error and stack trace if provided.
   * @param {string} message
   * @param {string | object | undefined} error
   * @param {string | undefined} stackTrace
   * @return {void}
   * @memberof Log
   * @method error
   * @instance
   */
  error(
    message: string,
    error: string | object | undefined,
    stackTrace: string | undefined,
  ): void {
    // Get the current time
    const now = this.currentTime();
    // Print the message
    console.error(`${now} | ${this.module} | ERROR | ${message}`);
    // Print the error and stack trace, if available
    if (error) {
      // Group the data for better readability
      console.group(`${now} | ${this.module} | ERROR DATA`);
      console.error(error);
      console.error(stackTrace);
      console.groupEnd();
    }
  }
}
