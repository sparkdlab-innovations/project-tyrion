import { AppErrorCodeParentMapType } from '../code.type';
import datasources from './datasources';
import puppeteer from './puppeteer';
import resolver from './resolver';
import scraper from './scraper';

const codes: AppErrorCodeParentMapType = {
  datasources,
  puppeteer,
  resolver,
  scraper,
};

export default codes;
