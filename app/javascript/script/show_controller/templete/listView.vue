<template>
  <div class="flex">
    <div v-for="value, index in allItem" :key="value.id" class="mr-2 p-1">
      <div class="bg-pink-200">
        <div class="h-8 w-64 flex border-black border-solid border-2 rounded">
          <div class="h-full w-11/12">
            <span
              @click="listUpdateButton(index)"
              v-show="listVisibleUpdate != index"
              :id="'list-item-' + index"
              class="block h-full w-full cursor-pointer"
            >{{value.title}}</span>
            <input
              @keydown.enter="listTitleUpdate(index,value)"
              @blur="listHiddenInput"
              v-show="listVisibleUpdate == index"
              :value="value.title"
              ref="listUpdateInput"
              type="text"
              class="block h-full w-full"
            />
          </div>
          <div class="h-full w-1/12 flex justify-center items-center m-auto">
            <div class>
              <i
                @click="listActionController($event, value)"
                class="fas fa-align-center cursor-pointer"
              ></i>
            </div>
          </div>
        </div>

        <card-view :card-array="value.card" :list-item="value" :list-index="index"></card-view>

        <card-create :list-item="value" :list-index="index"></card-create>
      </div>
    </div>
  </div>
</template>

<script>
import CardView from "./cardView.vue";
import CardCreate from "./cardCreate.vue";
import { mapState } from "vuex";

export default {
  data: function() {
    return {
      listVisibleUpdate: NaN
    };
  },
  methods: {
    listUpdateButton: function(index) {
      this.listVisibleUpdate = index;
      this.$nextTick(() => {
        this.$refs.listUpdateInput[index].focus();
      });
    },
    listHiddenInput: function() {
      this.listVisibleUpdate = NaN;
    },
    listTitleUpdate: function(index, value) {
      let url = location.pathname + `/lists/${value.id}.json`;
      let that = this;
      let newListTitle = this.$refs.listUpdateInput[index].value;
      axios
        .patch(`${url}`, {
          list: {
            title: newListTitle
          }
        })
        .then(function(response) {
          let successMessage = response.data.messages;
          that.$store.commit("getAllItem/listTitleUpdate", {
            index: index,
            title: response.data.title
          });
          that.$store.commit("addMessages/addMessage", "類別名稱更新完成");
        })
        .catch(function(error) {
          let errorMessage = error.response.data.title.toString();
          that.$store.commit("addMessages/addMessage", errorMessage);
        })
        .then(function() {
          that.listVisibleUpdate = NaN;
        });
    },
    listActionController: function(event, value) {
      let offectTop = event.target.offsetTop;
      let offectLeft = event.target.offsetLeft;
      let listId = value.id;
      this.$store.commit("hiddenItemController/listActionMenu", {
        view: true,
        listId: listId,
        offectTop: offectTop,
        offectLeft: offectLeft,
        
      });
    }
  },
  computed: mapState("getAllItem", ["allItem"]),
  components: {
    CardView,
    CardCreate
  }
};
</script>
