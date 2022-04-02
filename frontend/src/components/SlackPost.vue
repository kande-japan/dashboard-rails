<template>
  <q-card class="shadow-1">
    <q-card-section class="row" style="padding-bottom: 0">
      <q-avatar size="40px" color="grey-3">
        {{ name[0].toUpperCase() }}
      </q-avatar>

      <div class="column col q-ml-sm">
        <div class="col text-subtitle1">{{ name }}</div>
        <div class="col text-caption text-grey-6">30m ago</div>
      </div>

      <div class="">
        <q-btn icon="more_vert" flat round />
      </div>
    </q-card-section>

    <q-card-section>
      {{ text }}
    </q-card-section>
  </q-card>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
  props: ['text', 'name'],

  setup() {
    return;
  },
});
</script>
