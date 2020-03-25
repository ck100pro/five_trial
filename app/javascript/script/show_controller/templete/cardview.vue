<template>
  <div @click.stop class="max-h-68 overflow-auto">
    <div v-for="value, index in cardItem" :key="value.id" class="mb-2">
      <span
        @click="showCardContent"
        :id="'card-item-' + index"
        class="card-item block h-32 w-full cursor-pointer border-dashed border-2"
      >{{value.title}}</span>
      <i @click="cardDelete(index)" ref="cardDelete" class="cardDelete fas fa-times cursor-pointer"></i>
    </div>
  </div>
</template>

<script>
export default {
  props: ["cardItem", "listItem"],
  methods: {
    showCardContent: function(){

    },
    cardDelete: function(index) {
      console.log(this.listItem);
      let that = this;
      let cardId = this.cardItem[index].id;
      let url = `/cards/${cardId}.json`;
      axios
        .delete(`${url}`, {})
        .then(function(response) {
          let listIndex = that.listItem.listIndex;
          let listAndCardIndex = {
            listIndex: `${listIndex}`,
            cardIndex: `${index}`
          };
          that.$store.commit("getAllItem/deleteCard", listAndCardIndex);
          that.$store.commit("addMessages/addMessage", "文章刪除成功");
        })
        .then(function(error) {
          //暫定不處理，Rails端的驗證還沒處理好
        });
    }
  }
};
</script>