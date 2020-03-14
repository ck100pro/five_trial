<template>
  <div class="p-1">
    <div v-show="listVisible">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <button @click.self.stop="onclick" id="listButton" class="block h-full w-full cursor-pointer">新增列表</button>
      </div>
    </div>
    <div @click.stop v-show="!listVisible">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      listVisible: true
    }
  },
  methods: {
    onclick: function(){
      this.listVisible = !this.listVisible
    }
  }
}
</script>>