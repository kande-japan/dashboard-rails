import { MutationTree } from 'vuex';
import { ILoginResponse } from './actions';
import { IAuthState } from './state';

export const enum MutationTypes {
  SET_NEW_TOKEN = 'auth/SET_NEW_TOKEN',
  DELETE_TOKEN = 'auth/DELETE_TOKEN',
}

export interface Mutations<S = IAuthState> {
  [MutationTypes.SET_NEW_TOKEN](state: S, res: ILoginResponse): void;
  [MutationTypes.DELETE_TOKEN](state: S): void;
}

const mutation: MutationTree<IAuthState> & Mutations = {
  [MutationTypes.SET_NEW_TOKEN](state, res) {
    state.access = res.access;
    // TODO: JWTから解読
    // state.accessExpiresAtSec =

    state.refresh = res.refresh;
  },

  [MutationTypes.DELETE_TOKEN](state) {
    state.access = state.refresh = '';
    state.accessExpiresAtSec = state.refreshExpiresAtSec = null;
  },
};

export default mutation;
