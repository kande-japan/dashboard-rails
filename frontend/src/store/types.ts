import { ActionContext, DispatchOptions } from 'vuex';
import { IState, Mutations, Getters, Actions } from './index';

export type AugmentedActionContext<P> = {
  commit<K extends keyof Mutations>(
    key: K,
    payload?: Parameters<Mutations[K]>[1]
  ): ReturnType<Mutations[K]>;
} & {
  getters: {
    [K in keyof Getters]: ReturnType<Getters[K]>;
  };
} & {
  dispatch<K extends keyof Actions>(
    key: K,
    payload?: Parameters<Actions[K]>[1],
    options?: DispatchOptions
  ): ReturnType<Actions[K]>;
} & Omit<ActionContext<P, IState>, 'commit' | 'getters' | 'dispatch'>;
