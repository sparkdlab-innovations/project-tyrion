import { AppErrorCodeParentMapType } from '../code.type';
import puppeteer from './puppeteer';
import resolver from './resolver';
import scraper from './scraper';

const codes: AppErrorCodeParentMapType = {
  puppeteer,
  resolver,
  scraper,
};

export default codes;
