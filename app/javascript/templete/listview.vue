<template>
  <div>
    <div class="h-8 w-64 border-black border-solid border-2 rounded">
      <span class="block h-full w-full cursor-pointer">{{title}}</span>
    </div>
  </div>
</template>

<script>
export default {
  props: [
    "title"
  ]
}
</script>
