<template>
  <div class="flex">
    <div v-for="value, index in title" :data-position= index id="list-item">
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span class="block h-full w-full cursor-pointer">{{value.title}}</span>
      </div>
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <span class="block h-full w-full cursor-pointer">新增卡片</span>
      </div>
      <div class="h-8 w-64 border-black border-solid border-2 rounded">
        <input class="h-full w-full" type="text" v-model="cardTitle">
        <button @click="cardCreate">送出{{value.id}}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function(){
    return {
      cardTitle: undefined
    }
  },
  props: [
    "title"
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
      return path + "/lists/" + this.title[dataPosition].id + "/cards"
    },
    cardCreate: function(event){
      let url = this.selectUrl(event)
      console.log(url)
      axios.post(`${url}`,{
        title: this.cardTitle
      })
    }
  }
}
</script>
