<template>
  <div>
    <div
      v-show="cardViewController != listItem.index"
      class="h-8 w-64 border-black border-solid border-2 rounded"
    >
      <span
        @click="cardCreateButton"
        id="cardCreateButton"
        class="block h-full w-full cursor-pointer"
      >新增卡片</span>
    </div>
    <div
      v-show="cardViewController == listItem.index"
      class="h-8 w-64 border-black border-solid border-2 rounded"
    >
      <input v-model="cardTitle" ref="cardCreateInput" class="h-full w-full" type="text" />
      <button @click="cardCreate" id="cardSendCreate">新增卡片</button>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  data: () => {
    return {
      cardTitle: null,
    };
  },
  props: ["listItem"],
  methods: {
    cardCreateButton: function() {
      this.$store.commit(
        "cardCreateViewController/cardCreateViewController",
        this.listItem.index
      );
      this.$nextTick(() => {
        this.$refs.cardCreateInput.focus();
      });
    },
    cardCreate: function(event, index) {
      let url =
        location.pathname + `/lists/${this.listItem.list_id}/cards.json`;
      let that = this;
      axios
        .post(`${url}`, {
          card: {
            title: this.cardTitle
          }
        })
        .then(function(response) {
          let cardData = Object.assign(response.data, that.listItem);
          console.log(cardData);
          that.$store.commit("getAllItem/addCard", cardData);
          that.$store.commit("addMessages/addMessage", "Card新增成功");
        })
        .catch(function(error) {
          that.$store.commit("addMessages/addMessage", "Card新增失敗");
        })
        .then(function() {
          that.cardTitle = null;
          that.$refs.cardCreateInput.focus();
        });
    }
  },
  computed: mapState("cardCreateViewController", ["cardViewController"])
};
</script>>