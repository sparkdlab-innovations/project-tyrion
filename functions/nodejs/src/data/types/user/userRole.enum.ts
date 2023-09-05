export enum UserRoleEnum {
  viewer = 'viewer',
  user = 'user',
  editor = 'editor',
  admin = 'admin',
  superAdmin = 'superAdmin',
}

export type UserRole = keyof typeof UserRoleEnum;
