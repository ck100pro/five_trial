<template>
  <div class="flex">
    <div v-for="value in title">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span :id="value.id" class="block h-full w-full cursor-pointer">{{value.title}}</span>
      </div>
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span class="block h-full w-full cursor-pointer">新增卡片</span>
      </div>
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <input class="h-full w-full" type="text" v-model="cardTitle">
        <button @click="cardClick">送出</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      cardTitle: undefined,
      listId: undefined
    }
  },
  props: [
    "title"
  ],
  methods: {
    cardClick: function(){

    }
  }
}
</script>
