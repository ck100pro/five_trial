<template>
  <div @click.stop class="max-h-68 overflow-auto">
    <div v-for="value, index in cardItem" :key="value.id" class="mb-2">
      <span
        :id='"card-item-" + index'
        @click="test"
        class="block h-32 w-full cursor-pointer border-dashed border-2"
      >{{value.title}}</span>
      <i @click="cardDelete(index)" ref="cardDelete" class="fas fa-times cursor-pointer"></i>
    </div>
  </div>
</template>

<script>
export default {
  props: ["cardItem", "listIndex", "listId"],
  methods: {
    test: function(event) {
      this.$refs.cardDelete.indexOf(event);
    },
    cardDelete: function(index) {
      let that = this;
      let cardId = this.cardItem[index].id;
      let url =
        location.pathname + `/lists/${this.listId}/cards/${cardId}.json`;
      axios
        .delete(`${url}`, {})
        .then(function(response) {
          let listAndCardIndex = {
            listIndex: `${that.listIndex}`,
            cardIndex: `${index}`
          };
          that.$store.commit("getAllItem/deleteCard", listAndCardIndex);
          that.$store.commit("addMessages/addMessage", "Card刪除成功");
        })
        .then(function(error) {
          //暫定不處理，Rails端的驗證還沒處理好
        });
    }
  }
};
</script>