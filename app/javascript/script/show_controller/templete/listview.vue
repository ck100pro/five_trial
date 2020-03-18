<template>
  <div class="flex">
    <div v-for="value, index in allItem" :data-position="index" id="list-item" class="mr-2 p-1">
      <div class="bg-pink-200">
        <div class="h-8 w-64 border-black border-solid border-2 rounded">
          <span
            @click="listUpdateButton(index)"
            v-show="listVisibleUpdate != index"
            class="block h-full w-full cursor-pointer"
          >{{value.title}}</span>
          <input
            @keydown.enter="listTitleUpdate(index,value)"
            @blur="listHiddenInput"
            v-show="listVisibleUpdate == index"
            :value="value.title"
            ref="listUpdateInput"
            type="text"
            class="block h-full w-full cursor-pointer"
          />
        </div>

        <card-view
          :card-item="value.card"
          :list-item="{index: index, id: value.id}"
          v-on="$listeners"
        ></card-view>

        <card-create :list-item="{index: index, id: value.id}"></card-create>
      </div>
    </div>
  </div>
</template>

<script>
import CardView from "./cardview.vue";
import CardCreate from "./cardcreate.vue";
import { mapState } from "vuex";

export default {
  data: function() {
    return {
      cardVisibleController: NaN,
      listVisibleUpdate: NaN
    };
  },
  methods: {
    // selectUrl: function(event){
    //   let path = location.pathname
    //   let dataPosition = undefined
    //   let targetHtml = event.target

    //   while(dataPosition == undefined){
    //     dataPosition = targetHtml.parentNode.dataset.position
    //     targetHtml = targetHtml.parentNode
    //   }
    //   return path + "/lists/" + this.totalItem[dataPosition].id + "/cards.json"
    // },
    listUpdateButton: function(index) {
      this.listVisibleUpdate = index;
      this.$nextTick(() => {
        this.$refs.listUpdateInput[index].focus();
      });
    },
    listHiddenInput: function() {
      this.listVisibleUpdate = NaN;
    },
    listTitleUpdate: function(index, data) {
      let url = location.pathname + `/lists/${data.id}.json`;
      let that = this;
      let newListTitle = this.$refs.listUpdateInput[index].value;
      axios
        .patch(`${url}`, {
          list: {
            title: newListTitle
          }
        })
        .then(function(response) {
          that.$emit("list-title-update", response, index);
        })
        .catch(function(error) {
          that.$emit("list-title-update", error.response);
        })
        .then(function() {
          Vue.set(that, "listVisibleUpdate", NaN);
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
