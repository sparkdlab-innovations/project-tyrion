import { AppErrorCodeParentMapType } from '../code.type';
import puppeteer from './puppeteer';
import scraper from './scraper';

const codes: AppErrorCodeParentMapType = {
  puppeteer,
  scraper,
};

export default codes;
