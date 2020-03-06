
<template>
  <div class="flex">
    <div v-for="value, index in totalItem" :data-position="index" id="list-item" class="mr-2 p-1">
      <div class="bg-pink-200">
        <div class="h-8 w-64 border-black border-solid border-2 rounded">
          <span class="block h-full w-full cursor-pointer">{{value.title}}</span>
        </div>

        <card-view :card-item="value.card"></card-view>

        <div>
          <div class="h-8 w-64 border-black border-solid border-2 rounded">
            <span class="block h-full w-full cursor-pointer">新增卡片</span>
          </div>
          <div class="h-8 w-64 border-black border-solid border-2 rounded">
            <input class="h-full w-full" type="text" v-model="cardName">
            <button @click="cardCreate">送出{{value.id}}</button>
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
      cardName: null
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
    cardCreate: function(event){
      let url = this.selectUrl(event)
      let that = this
      console.log(url)
      console.log(that.totalItem)
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
        console.log(error.response)
      })
    }
  },
  components: {
    CardView
  }
}
</script>
