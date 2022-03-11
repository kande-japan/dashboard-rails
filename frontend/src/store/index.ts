import { store } from 'quasar/wrappers';
import { InjectionKey } from 'vue';
import {
  CommitOptions,
  createStore,
  Store as VuexStore,
  useStore as vuexUseStore,
  DispatchOptions,
} from 'vuex';
import createPersistedState from 'vuex-persistedstate';

import auth from './auth';
import { IAuthState } from './auth/state';
import { Mutations as AuthMutations } from './auth/mutations';
import { Actions as AuthActions } from './auth/actions';
import { Getters as AuthGetters } from './auth/getters';
import { Cookies } from 'quasar';

// import example from './module-example'
// import { ExampleStateInterface } from './module-example/state';

/*
 * If not building with SSR mode, you can
 * directly export the Store instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Store instance.
 */

export interface IState {
  // Define your own store structure, using submodules if needed
  // example: ExampleStateInterface;
  // Declared as unknown to avoid linting issue. Best to strongly type as per the line above.
  auth: IAuthState;
}

export type Mutations = AuthMutations;
export type Actions = AuthActions;
export type Getters = AuthGetters;

export type TStore = Omit<
  VuexStore<IState>,
  'getters' | 'commit' | 'dispatch'
> & {
  commit<K extends keyof Mutations, P extends Parameters<Mutations[K]>[1]>(
    key: K,
    payload?: P,
    options?: CommitOptions
  ): ReturnType<Mutations[K]>;
} & {
  dispatch<K extends keyof Actions>(
    key: K,
    payload?: Parameters<Actions[K]>[1],
    options?: DispatchOptions
  ): ReturnType<Actions[K]>;
} & {
  getters: {
    [K in keyof Getters]: ReturnType<Getters[K]>;
  };
};

// provide typings for `this.$store`
declare module '@vue/runtime-core' {
  interface ComponentCustomProperties {
    // $store: VuexStore<IState>;
    $store: TStore;
  }
}

// provide typings for `useStore` helper
export const storeKey: InjectionKey<VuexStore<IState>> = Symbol('vuex-key');

export default store(function (/* { ssrContext } */) {
  const Store = createStore<IState>({
    modules: {
      // example
      auth,
    },

    // enable strict mode (adds overhead!)
    // for dev mode and --debug builds only
    strict: !!process.env.DEBUGGING,

    plugins: [
      createPersistedState({
        key: 'auth',
        paths: [
          'auth.access',
          'auth.accessExpiresAtSec',
          'auth.refresh',
          'auth.refreshExpiresAtSec',
        ],
        storage: {
          getItem: (key: string): string => Cookies.get(key),
          setItem: (key: string, value: string) =>
            Cookies.set(key, value, { expires: 31, secure: true }),
          removeItem: (key: string) => Cookies.remove(key),
        },
      }),
    ],
  });

  return Store as TStore;
});

export function useStore() {
  return vuexUseStore(storeKey) as TStore;
}
