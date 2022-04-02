<template>
  <div class="row justify-between">
    <div class="column col">
      <div class="text-h5 text-weight-bold">
        Hello, {{ user?.name.split(' ')[0] }}
      </div>
      <div class="text-subtitle2 text-grey-6">
        Today is
        {{
          [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
          ][date.getDay()]
        }}, {{ date.getDate() }}
        {{
          [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December',
          ][date.getMonth()]
        }}
        {{ date.getFullYear() }}
      </div>
    </div>

    <q-input
      filled
      class="col"
      placeholder="Search..."
      style="max-width: 250px"
    />
  </div>
</template>

<script lang="ts">
import { api } from 'src/boot/axios';
import { defineComponent, ref } from 'vue';
import { useStore } from 'src/store';
// import { IMeResponse } from './AppBar.vue';

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
      date: new Date(),
    };
  },
});
</script>
