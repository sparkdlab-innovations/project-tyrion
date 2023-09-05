import { AppErrorCodeParentMapType } from '../code.type';
import datasources from './datasources';
import resolver from './resolver';

const codes: AppErrorCodeParentMapType = {
  datasources,
  resolver,
};

export default codes;
