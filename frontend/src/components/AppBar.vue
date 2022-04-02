<template>
  <div class="column items-first text-center text-grey-10 app-bar">
    <div class="row items-center justify-center q-gutter-sm q-my-lg">
      <img src="/icons/pie-chart.png" alt="chart" class="pie-chart" />
      <div class="text-h6">Dashboard</div>
    </div>

    <div class="q-my-lg">
      <q-avatar size="60px" color="orange-3" class="q-mb-md">{{
        user?.name[0].toUpperCase()
      }}</q-avatar>

      <div class="text-subtitle1">{{ user?.name }}</div>
      <div class="text-caption text-grey-6">{{ user?.email }}</div>
    </div>
  </div>
</template>

<script lang="ts">
import { api } from 'src/boot/axios';
import { defineComponent, ref } from 'vue';
import { useStore } from 'src/store';

export interface IMeResponse {
  id: string;
  email: string;
  name: string;
}

export default defineComponent({
  async setup() {
    const store = useStore();
    const user = ref<IMeResponse>();

    try {
      const res = await api.get<IMeResponse>(
        '/users/me',
        store.getters.defaultAxiosConfig
      );

      user.value = res.data;
    } catch (err) {
      console.log(err);
    }

    return {
      user,
    };
  },
});
</script>

<style lang="scss">
.app-bar {
  height: 100vh !important;
}

.pie-chart {
  width: 20px;
}
</style>
