
<template>
  <div class="flex">
    <div v-for="value, index in totalItem" :data-position="index" id="list-item" class="mr-2 p-1">
      <div @click.stop class="bg-pink-200">
        <div class="h-8 w-64 border-black border-solid border-2 rounded">
          <span @click="listUpdateButton(index)"  v-show="listVisibleUpdate != index" class="block h-full w-full cursor-pointer">{{value.title}}</span>
          <input  @keydown.enter="listUpdate(index,value)" v-show="listVisibleUpdate == index" :value="value.title" ref="listUpdateInput"  type="text" class="block h-full w-full cursor-pointer" >
        </div>

        <card-view :card-item="value.card"></card-view>

        <div @click.stop>
          <div v-show="cardVisibleController != index" class="h-8 w-64 border-black border-solid border-2 rounded">
            <span @click="cardCreateButton(index)" class="block h-full w-full cursor-pointer">新增卡片</span>
          </div>
          <div v-show="cardVisibleController == index" class="h-8 w-64 border-black border-solid border-2 rounded">
            <input v-model="cardName" ref="cardCreateInput" class="h-full w-full" type="text">
            <button @click="cardCreate($event, index)">送出{{value.id}}</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import CardView from "./cardview.vue"

export default {

  data: function(){
    return {
      cardName: null,
      cardVisibleController : NaN,
      listVisibleUpdate: NaN,
    }
  },
  props: [
    "totalItem"
  ],
  methods: {
    selectUrl: function(event){
      let path = location.pathname
      let dataPosition = undefined
      let targetHtml = event.target

      while(dataPosition == undefined){
        dataPosition = targetHtml.parentNode.dataset.position
        targetHtml = targetHtml.parentNode
      }
      return path + "/lists/" + this.totalItem[dataPosition].id + "/cards.json"
    },
    cardCreateButton: function(index){
      this.cardVisibleController = index
      this.$nextTick(() => {
        this.$refs.cardCreateInput[index].focus()
      })
    },
    listUpdateButton: function(index){
      console.log(this.$refs.listUpdateInput[index])
      this.listVisibleUpdate = index
      this.$nextTick(() => {
        this.$refs.listUpdateInput[index].focus()
      })
    },
    cardCreate: function(event, index){
      let url = this.selectUrl(event)
      let that = this
      axios.post(`${url}`,{
        card:{
          title: this.cardName
        }
      })
      .then(function(response){
        let cardData = response.data
        that.$emit("update-card", cardData)
      })
      .catch(function(error){
        let cardData = error.response
        that.$emit("update-card", cardData)
      });
      Vue.set(this,"cardName", null)
      this.$refs.cardCreateInput[index].focus()
    },
    listUpdate: function(index,data){
      let url = location.pathname + `/lists/${data.id}.json`
      let that = this
      let newListTitle = this.$refs.listUpdateInput[index].value
      axios.patch(`${url}`,{
        list:{
          title: newListTitle
        }
      })
      .then(function(response){
        let listUpdateData = response
        console.log(listUpdateData)
        that.$emit("update-list", listUpdateData, index)
      })
      .catch(function(error){

      })
      .then(function(){
        Vue.set(that,"listVisibleUpdate", NaN)
      })
    },
    resetButton: function(){
      this.cardVisibleController = NaN
    }
  },
  components: {
    CardView
  }
}
</script>
