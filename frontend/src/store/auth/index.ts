import { Module } from 'vuex';
import { IState } from '..';
import state, { IAuthState } from './state';
import actions from './actions';
import getters from './getters';
import mutations from './mutations';

const module: Module<IAuthState, IState> = {
  namespaced: false,
  actions,
  getters,
  mutations,
  state,
};

export default module;
