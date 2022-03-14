import jwtDecode from 'jwt-decode';
import jwt_decode from 'jwt-decode';
import { MutationTree } from 'vuex';
import { ILoginResponse } from './actions';
import { IAuthState } from './state';

export const enum MutationTypes {
  SET_NEW_TOKEN = 'auth/SET_NEW_TOKEN',
  DELETE_TOKEN = 'auth/DELETE_TOKEN',
}

export interface IToken {
  iss: string;
  aud: string;
  exp: number;
}

export interface Mutations<S = IAuthState> {
  [MutationTypes.SET_NEW_TOKEN](state: S, res: ILoginResponse): void;
  [MutationTypes.DELETE_TOKEN](state: S): void;
}

const mutation: MutationTree<IAuthState> & Mutations = {
  [MutationTypes.SET_NEW_TOKEN](state, res) {
    const decodedAccessToken: IToken = jwt_decode(res.token);
    state.access = res.token;
    state.accessExpiresAtSec = decodedAccessToken.exp;

    const decodedRefreshToken: IToken = jwtDecode(res.refresh_token);
    state.refresh = res.refresh_token;
    state.refreshExpiresAtSec = decodedRefreshToken.exp;
  },

  [MutationTypes.DELETE_TOKEN](state) {
    state.access = state.refresh = '';
    state.accessExpiresAtSec = state.refreshExpiresAtSec = null;
  },
};

export default mutation;
