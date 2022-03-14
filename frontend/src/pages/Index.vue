<template>
  <q-page class="row items-center justify-evenly">
    <q-form
      autofocus
      greedy
      @submit="login"
      class="col-12"
      style="max-width: 500px"
    >
      <q-card class="q-ma-lg">
        <q-card-section>
          <div class="text-h6">Log in</div>
          <div class="text-subtitle2">Kande Inc.</div>
        </q-card-section>

        <q-separator />

        <q-card-section>
          <q-input
            :rules="[rules.required]"
            label="Email"
            type="email"
            v-model="email"
          />
          <q-input
            :rules="[rules.required]"
            label="Password"
            type="password"
            v-model="password"
          />
        </q-card-section>

        <q-card-actions>
          <q-space />
          <q-btn
            class="full-width"
            rounded
            color="secondary"
            type="submit"
            :loading="loading"
          >
            サインイン
          </q-btn>
        </q-card-actions>
      </q-card>
    </q-form>
  </q-page>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import { useStore } from 'src/store';
import { ActionTypes as AuthActionTypes } from 'src/store/auth/actions';
import { useRouter } from 'vue-router';

export default defineComponent({
  name: 'Index',
  setup() {
    const email = ref('');
    const password = ref('');
    const loading = ref(false);

    const store = useStore();
    const router = useRouter();

    return {
      email,
      password,
      loading,

      rules: {
        required: (value: string) => !!value || 'This field is required.',
      },

      async login() {
        loading.value = true;

        await store
          .dispatch(AuthActionTypes.login, {
            email: email.value,
            password: password.value,
          })
          .catch((err) => {
            loading.value = false;
            console.log(err);
          });

        loading.value = false;
        console.log('succeed!!');
        void router.push('/dashboard');
      },
    };
  },
});
</script>
