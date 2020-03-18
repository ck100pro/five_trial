<template>
  <div class="p-1">
    <div>
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <button id="listCreateButton" class="block h-full w-full cursor-pointer">新增清單</button>
      </div>
    </div>
    <div>
      <input
        v-model="listTitle"
        type="text"
        class="h-8 w-64 border-black border-solid border-2 rounded"
      >
      <div>
        <button @click="listCreate" id="listSendCreate">送出清單</button>
        <i class="fas fa-times"></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      listTitle: undefined
    };
  },
  methods: {
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
          that.$store.commit("getAllItem/addList", response);
          that.$store.commit("addMessages/addMessage", "List新增成功")
        })
        .catch(function(error) {
          that.$store.commit("addMessages/addMessage", "List新增失敗")
        })
        .then(function() {
          that.listTitle = "";
        });
    }
  }
};
</script>>