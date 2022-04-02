<template>
  <q-page class="row justify-start items-start">
    <div class="header col-12 row items-center">
      <Suspense>
        <Header class="col-12" />
      </Suspense>

      <div class="col-12 row">
        <div class="col-5">
          <div v-for="post in posts" :key="post.text">
            <slack-post :name="post.name" :text="post.text" class="q-my-md" />
          </div>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import Header from 'src/components/Header.vue';
import SlackPost from 'src/components/SlackPost.vue';

export default defineComponent({
  components: {
    Header,
    SlackPost,
  },

  setup() {
    const posts = [
      {
        name: 'Damin',
        text: 'Hello, World',
      },
      {
        name: 'Nissy',
        text: 'Ruby booby',
      },
    ];
    return {
      posts,
    };
  },
});
</script>
