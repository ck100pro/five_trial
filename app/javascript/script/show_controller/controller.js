import store from "./store"
import ListView from "./templete/listview.vue"

document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    store,
    data: {
      message: undefined,
      listTitle: undefined
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
      listCreate: function(){
        let url = location.pathname + "/lists.json"
        let that = this
        axios.post(`${url}`, {
          list:{
            title: this.listTitle
          }
        })
        .then(function(response){
          that.$store.commit("addList", response);
          that.message = "List新增成功"
        })
        .catch(function(error){
          that.message = "List新增失敗"
        })
        .then(function(){
          that.listTitle = ""
        })
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
      updateList: function(updateList, index){
        if(updateList.status == 400){
          Vue.set(show,"message","List更新失敗")
        } else {
          let newListTitle = updateList.data.title
          Vue.set(show,"message","List更新成功")
          Vue.set(show.listItem[index], "title", newListTitle)
        }
      }
    },
    created: function(){
      this.$store.dispatch("getAllItem/getAllItem");
    },
    mounted: function(){
      // let listenList = document.getElementById('listForm')
      // listenList.addEventListener('ajax:success', function(data){
      //   let listData = data.detail[0]
      //   let length = show.listItem.length 
      //   Vue.set(show.listItem,length,listData)
      //   Vue.set(show,"message","List新增成功")
      // });
      // listenList.addEventListener('ajax:error', function(data){
      //   let listData = data.detail[0]
      //   Vue.set(show,"message",listData.title[0])
      // });
    },
    components: {
      ListView
    }
  })
})