<template>
  <div v-if="listActionMenu.view" class="fixed w-32 h-32 bg-teal-500" style="top: 162px; left:241px"></div>
</template>

<script>
import { mapState } from "vuex";
export default {
  data: () => {
    return {};
  },
  methods: {},
  computed: mapState("hiddenItemController",["listActionMenu"])
};
</script>