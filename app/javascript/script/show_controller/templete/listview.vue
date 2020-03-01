<template>
  <div class="flex">
    <div v-for="value in title">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span :id=value.id class="block h-full w-full cursor-pointer">{{value.title}}</span>
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
