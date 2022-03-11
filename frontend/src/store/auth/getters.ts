import { GetterTree } from 'vuex';
import { IState } from '..';
import { IAuthState } from './state';

export interface IDefaultConfig {
  headers: {
    Authoriazation: string;
  };
}

export interface Getters {
  defaultAxiosConfig(context: IAuthState): IDefaultConfig;
}

const getters: GetterTree<IAuthState, IState> & Getters = {
  defaultAxiosConfig(context) {
    return {
      headers: {
        Authoriazation: `Bearer ${context.access}`,
      },
    };
  },
};

export default getters;
