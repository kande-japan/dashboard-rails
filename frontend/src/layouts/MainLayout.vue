<template>
  <q-layout view="lHh Lpr lFf" class="main-bg">
    <div class="row q-py-sm q-px-lg">
      <Suspense>
        <app-bar class="col-2" />
      </Suspense>
      <div class="col-1 row justify-center">
        <div class="vl" />
      </div>
      <q-page-container class="col-9 q-py-lg">
        <router-view />
      </q-page-container>
    </div>
  </q-layout>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import AppBar from 'src/components/AppBar.vue';

export default defineComponent({
  name: 'MainLayout',

  components: {
    AppBar,
  },

  setup() {
    return;
  },
});
</script>

<style lang="scss">
.main-bg {
  background-color: #fcfbf7;
}

.vl {
  width: 1px;
  height: 100vh;
  background-color: $grey-4;
}
</style>
