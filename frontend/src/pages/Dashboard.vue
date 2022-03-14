<template>
  <div>Logged In!</div>
  <div>Username: {{ username }}</div>
  <div>Authorization: {{ authorizationHeader }}</div>
</template>

<script lang="ts">
import { useStore } from 'src/store';
import { defineComponent, ref } from 'vue';

export default defineComponent({
  setup() {
    const username = ref('Yassan');

    const store = useStore();
    const authorizationHeader = store.getters.defaultAxiosConfig;

    return {
      username,
      authorizationHeader,
    };
  },
});
</script>
