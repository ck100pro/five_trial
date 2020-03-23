<template>
  <div class="p-1">
    <div v-show="!view">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <button
          @click="listCreateButton"
          name="listCreateButton"
          class="block h-full w-full cursor-pointer"
        >新增清單</button>
      </div>
    </div>
    <div v-show="view">
      <input
        ref="listCreateInput"
        v-model="listTitle"
        type="text"
        class="listTitleInput h-8 w-64 border-black border-solid border-2 rounded"
      />
      <div>
        <button @click="listCreate" name="listSendCreate">送出清單</button>
        <i @click="listCreateButton" class="fas fa-times"></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      listTitle: null,
      view: false
    };
  },
  methods: {
    listCreateButton: function() {
      if (this.view == true) {
        this.view = false;
      } else {
        this.view = true;
      }
      this.$nextTick(() => {
        this.$refs.listCreateInput.focus();
      });
    },
    listCreate: function() {
      let url = location.pathname + "/lists.json";
      let that = this;
      axios
        .post(`${url}`, {
          list: {
            title: this.listTitle
          }
        })
        .then(function(response) {
          let successMessage = response.data.messages
          that.$store.commit("getAllItem/addList", response);
          that.$store.commit("addMessages/addMessage", successMessage);
        })
        .catch(function(error) {
          let errorMessage = error.response.data.title.toString()
          that.$store.commit("addMessages/addMessage", errorMessage);
        })
        .then(function() {
          that.listTitle = "";
        });
    }
  }
};
</script>>