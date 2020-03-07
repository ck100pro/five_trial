<template>
  <div class="p-1">
    <div v-show="listVisible">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span @click="onclick" id="listButton" class="block h-full w-full cursor-pointer">新增列表</span>
      </div>
    </div>
    <div v-show="!listVisible">
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