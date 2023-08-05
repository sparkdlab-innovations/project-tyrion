import {
  Browser,
  BrowserConnectOptions,
  BrowserContext,
  BrowserLaunchArgumentOptions,
  LaunchOptions,
  Page,
  Product,
} from 'puppeteer';

export type BrowserOptions = LaunchOptions &
  BrowserLaunchArgumentOptions &
  BrowserConnectOptions & {
    product?: Product;
    extraPrefsFirefox?: Record<string, unknown>;
  };

export type BrowserSession = {
  browser: Browser;
  page: Page;
  incognitoContext: BrowserContext | undefined;
};
