<template>
  <div @click.stop class="max-h-68 overflow-auto">
    <div v-for="value, index in cardArray" :key="value.id" class="mb-2">
      <card-view-content :card-content="value" :card-index="index" :list-item="listItem"></card-view-content>

      <i @click="cardDelete(index)" ref="cardDelete" class="cardDelete fas fa-times cursor-pointer"></i>
    </div>
  </div>
</template>

<script>
import cardViewContent from "./cardViewContent";
export default {
  props: ["cardArray", "listItem", "listIndex"],
  methods: {
    cardDelete: function(index) {
      let that = this;
      let cardId = this.cardArray[index].id;
      let url = `/cards/${cardId}.json`;
      axios
        .delete(`${url}`, {})
        .then(function(response) {
          let listAndCardIndex = {
            listIndex: `${that.listIndex}`,
            cardIndex: `${index}`
          };
          that.$store.commit("getAllItem/deleteCard", listAndCardIndex);
          that.$store.commit("addMessages/addMessage", "文章刪除成功");
        })
        .then(function(error) {
          //暫定不處理，Rails端的驗證還沒處理好
        });
    }
  },
  components: {
    cardViewContent
  }
};
</script>