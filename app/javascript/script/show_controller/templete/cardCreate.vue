<template>
  <div>
    <div
      v-show="cardCreateItem != listIndex"
      class="h-8 w-64 border-black border-solid border-2 rounded"
    >
      <span
        @click="cardCreateButton"
        class="cardCreateButton block h-full w-full cursor-pointer"
      >新增文章</span>
    </div>
    <div
      v-show="cardCreateItem === listIndex"
      class="h-8 w-64 border-black border-solid border-2 rounded"
    >
      <input
        v-model="cardTitle"
        ref="cardCreateInput"
        class="cardCreateInput h-full w-full"
        type="text"
      />
      <button @click="cardCreate" name="cardSendCreate">建立文章</button>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  data: () => {
    return {
      cardTitle: null
    };
  },
  props: ["listItem", "listIndex"],
  methods: {
    cardCreateButton: function() {
      this.$store.commit(
        "hiddenItemController/cardCreateItem",
        this.listIndex
      );
      this.$nextTick(() => {
        this.$refs.cardCreateInput.focus();
      });
    },
    cardCreate: function(event, index) {
      let url = `/lists/${this.listItem.id}/cards.json`;
      let that = this;
      axios
        .post(`${url}`, {
          card: {
            title: this.cardTitle
          }
        })
        .then(function(response) {
          that.$store.commit("getAllItem/addCard", response.data);
          that.$store.commit("addMessages/addMessage", "文章新增成功");
        })
        .catch(function(error) {
          let errorMessage = error.response.data.title.toString();
          that.$store.commit("addMessages/addMessage", errorMessage);
        })
        .then(function() {
          that.cardTitle = null;
          that.$refs.cardCreateInput.focus();
        });
    }
  },
  computed: mapState("hiddenItemController", ["cardCreateItem"])
};
</script>>