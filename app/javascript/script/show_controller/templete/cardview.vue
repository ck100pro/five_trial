<template>
  <div @click.stop class="max-h-68 overflow-auto">
    <div v-for="value, index in cardItem" class="mb-2">
      <span @click="test" class="block h-32 w-full cursor-pointer border-dashed border-2">{{value.title}}</span>
      <i @click="cardDelete(index)" ref="cardDelete" class="fas fa-times cursor-pointer"></i>
    </div>
  </div>
</template>

<script>
  export default {
    props: [
      "cardItem",
      "listItem"
    ],
    methods: {
      test: function(event){
        console.log(this.cardItem)
        this.$refs.cardDelete.indexOf(event)
        console.log(this.$refs.cardDelete.indexOf(event.target))
      },
      cardDelete:function(index){
        let that = this
        let listItem = this.listItem
        let cardId = this.cardItem[index].id
        let url = location.pathname + `/lists/${listItem.id}/cards/${cardId}.json` 
        axios.delete(`${url}`,{
        })
        .then(function(response){
          console.log(that)
          console.log(response)
          let listAndCardIndex = {"list_index": `${listItem.index}`, "card_index": `${index}`}
          that.$emit("delett-card",listAndCardIndex)
        })
        .then(function(error){
          //暫定不處理，Rails端的驗證還沒處理好
        })
      }
    }
  }
</script>