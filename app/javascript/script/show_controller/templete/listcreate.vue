<template>
  <div class="p-1">
    <div @click="onclick" v-show="visible">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span id="listButton" class="block h-full w-full cursor-pointer">新增列表</span>
      </div>
    </div>
    <div @click.stop v-show="!visible">
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {visible: true
    }
  },
  methods: {
    onclick: function(){
      this.visible = !this.visible
    }
  }
}
</script>>