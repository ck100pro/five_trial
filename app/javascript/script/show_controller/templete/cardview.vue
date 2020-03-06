<template>
  <div class="max-h-68 overflow-auto">
    <div v-for="value in cardItem" class="">
      <span class="block h-32 w-full cursor-pointer">{{value.title}}</span>
    </div>
  </div>
</template>

<script>
  export default {
    props: [
      "cardItem"
    ]
  }
</script>