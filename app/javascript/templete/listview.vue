<template>
  <div class="flex">
    <div v-for="index in title">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span :id=index[0] class="block h-full w-full cursor-pointer">{{index[1]}}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: [
    "title"
  ],
}
</script>
