import Log from '../log';
import { AppErrorSeverity } from './appErrorSeverity.enum';
import codes, { AppErrorCodeType } from './codes';

/**
 * Error Class
 * @class AppError
 * @description
 * A class to represent an error in the application.
 * @param {string} module
 * @param {string} name
 * @param {number} code
 * @param {string} message
 * @param {number} severity
 * @param {string | undefined} cause
 * @param {string | undefined} stack
 * @public
 */
export default class AppError implements Error {
  public readonly module: string;
  public readonly name: string;
  public readonly code: number;
  public readonly message: string;
  public readonly severity: AppErrorSeverity;
  public readonly cause?: string;
  public readonly stack?: string;

  /**
   * Constructor
   * @description
   * Creates an instance of AppError.
   * @param {string} module
   * @param {string} name
   * @param {number} code
   * @param {string} message
   * @param {AppErrorSeverity} severity
   * @param {string} cause
   * @param {string | undefined} stack
   * @memberof AppError
   * @constructor
   */
  constructor(
    module: string,
    name: string,
    code: number,
    message: string,
    severity: AppErrorSeverity,
    cause?: string,
    stack?: string | undefined,
  ) {
    // Set the module name
    this.module = module;
    // Set the name
    this.name = name;
    // Set the code
    this.code = code;
    // Set the message
    this.message = message;
    // Set the severity
    this.severity = severity;
    // Set the cause if provided
    if (cause) this.cause = cause;
    // Set the stack trace if provided
    if (stack) this.stack = stack;
  }

  /**
   * From Code
   * @description
   * Retrieves an AppError from predefined error codes
   * @memberof AppError
   * @method fromCode
   * @public
   * @static
   * @param {string} code
   * @param {string | undefined} cause
   * @param {string | undefined} stack
   * @return {AppError} AppError object
   *
   * @example
   * ```ts
   * AppError.fromErrorOrCode(
   *  'module/submodule/code',
   *  `Cause: ${cause}`,
   *  new Error().stack
   * );
   * ```
   */
  public static fromCode(
    code: string,
    cause?: string,
    stack?: string | undefined,
  ): AppError {
    const error: AppErrorCodeType =
      codes[code.split('/')[0]][code.split('/')[1]][code.split('/')[2]];

    if (error.shouldLog) {
      const log = new Log(error.module);
      if (error.severity >= AppErrorSeverity.high) {
        log.error(`${error.name} | ${error.message}`, cause, stack);
      } else {
        log.warn(`${error.name} | ${error.message} | Cause: ${cause}`);
      }
    }

    return new AppError(
      error.module,
      error.name,
      error.code,
      error.message,
      error.severity,
      cause,
      stack,
    );
  }

  /**
   * From Error Or Code
   * @description
   * Retrieves an AppError from an Error object or predefined error codes
   * @memberof AppError
   * @method fromErrorOrCode
   * @public
   * @static
   * @param {string} code
   * @param {unknown | undefined} error
   * @param {string | undefined} cause
   * @param {string | undefined} stack
   * @return {AppError} AppError object
   *
   * @example
   * ```ts
   * AppError.fromErrorOrCode(
   *  'module/submodule/code',
   *  error,
   *  `Cause: ${cause}`,
   *  new Error().stack
   * );
   * ```
   */
  public static fromErrorOrCode(
    code: string,
    error?: unknown,
    cause?: string,
    stack?: string | undefined,
  ): AppError {
    if (this.isAppError(error)) {
      return error;
    }
    if (error instanceof Error) {
      return AppError.fromCode(
        code,
        `Cause: ${cause}\n\nError: ${error.message}`,
        error.stack ?? stack,
      );
    }
    return AppError.fromCode(code, `Cause: ${cause}\n\nError: ${error}`, stack);
  }

  /**
   * Clean
   * @description
   * Returns a cleaned up version of the error object
   * @memberof AppError
   * @method clean
   * @public
   * @return {CleanAppError} cleaned up error object
   */
  public clean(): CleanAppError {
    return {
      name: `${this.module}/${this.name}`,
      code: this.code,
      message: this.message,
    };
  }

  /**
   * To String
   * @description
   * Returns a string representation of the error
   * @memberof AppError
   * @method toString
   * @public
   * @return {string} string representation of the error
   */
  public toString(): string {
    return `${this.module}/${this.name} | ${this.message}`;
  }

  /**
   * Is AppError
   * @description
   * Checks if the provided error is an AppError
   * @memberof AppError
   * @method isAppError
   * @public
   * @static
   * @param {unknown} error
   * @return {AppError}
   */
  public static isAppError(error: unknown): error is AppError {
    if (typeof error !== 'object' || error === null) {
      return false;
    }

    const { module, name, code, message, severity, cause, stack } =
      error as AppError;

    if (typeof module !== 'string') {
      return false;
    }

    if (typeof name !== 'string') {
      return false;
    }

    if (typeof code !== 'number') {
      return false;
    }

    if (typeof message !== 'string') {
      return false;
    }

    if (typeof severity !== 'number') {
      return false;
    }

    if (typeof cause !== 'string' && typeof cause !== 'undefined') {
      return false;
    }

    if (typeof stack !== 'string' && typeof stack !== 'undefined') {
      return false;
    }

    return true;
  }
}

export interface CleanAppError {
  name: string;
  code: number;
  message: string;
}
