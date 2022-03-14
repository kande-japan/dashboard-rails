import { ActionTree } from 'vuex';
import { api } from 'boot/axios';
import { IState } from '..';
import { IAuthState } from './state';
import { MutationTypes } from './mutations';
import { AugmentedActionContext } from '../types';

export interface ILoginRequest {
  email: string;
  password: string;
}

export interface ILoginResponse {
  token: string;
  refresh_token: string;
}

export const enum ActionTypes {
  login = 'auth/login',
  logout = 'auth/logout',
}

export interface Actions {
  [ActionTypes.login](
    context: AugmentedActionContext<IAuthState>,
    payload: ILoginRequest
  ): Promise<void>;
}

const actions: ActionTree<IAuthState, IState> & Actions = {
  async [ActionTypes.login](context, payload) {
    const { data } = await api.post<ILoginResponse>('/token', payload);
    context.commit(MutationTypes.SET_NEW_TOKEN, data);
  },

  [ActionTypes.logout](context) {
    context.commit(MutationTypes.DELETE_TOKEN);
  },
};

export default actions;
