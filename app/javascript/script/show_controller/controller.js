import store from "./store"
import { mapState } from "vuex"
import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"

document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    store,
    data: {
      message: undefined,
    },
    methods: {
      resetButton: function(event){
        // let targetId = event.target.id
        // console.log(this.listItem)
        // this.$refs.ListCreate.listVisible = true
        // this.$refs.ListView.cardVisibleController = NaN
        // this.$store.dispatch("getAllItem");
        // console.log(this.$store.state.allItem.allItem)
        // console.log(this.listItem)
        // if (targetId != "listButton" || targetId != "cardButton"){
        //   this.$refs.ListCreate.listVisible = true
        //   this.$refs.ListView.cardVisibleController = NaN
        //   console.log("123456")
        // }
      },
      getNewCard: function(data){
        if (data.status == 400){
          Vue.set(show,"message","CARD新增失敗")
        } else {
          let targetList = this.listItem.find(item => item.id == data.list_id)
          targetList.card.push(data)
          Vue.set(show,"message","CARD新增成功")
        }
      },
      deleteCard: function(data){
        let cardIndex = data.card_index
        let listIndex= data.list_index
        Vue.set(show,"message","卡片刪除成功")
        Vue.delete(show.listItem[listIndex].card, cardIndex)
      },      
      listTitleUpdate: function(updateList, index){
        if(updateList.status == 400){
          this.message = "List更新失敗"
        } else {
          let newListTitle =  {index: index, title: updateList.data.title}
          this.$store.commit("getAllItem/listTitleUpdate", newListTitle);
          this.message = "List更新成功"
        }
      }
    },
    created: function(){
      this.$store.dispatch("getAllItem/getAllItem");
    },
    computed: mapState('addMessages', ['messages']),
    components: {
      ListView,
      ListCreate
    }
  })
})