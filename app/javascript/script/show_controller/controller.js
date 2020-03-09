import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"



document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    data: {
      listItem: undefined,
      message: undefined
    },
    methods: {
      resetButton: function(event){
        let targetId = event.target.id
        console.log(event.target)
        this.$refs.ListCreate.listVisible = true
        this.$refs.ListView.cardVisibleController = NaN
        console.log(this.$refs.ListView.cardVisibleController)
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
      updateList: function(updateList, index){
        let newListTitle = updateList.data.title
        Vue.set(show,"message","List更新成功")
        Vue.set(show.listItem[index], "title", newListTitle)
      }
    },
    created: function(){
      let path = location.pathname
      let url = path + ".json"
      axios.get(`${url}`)
        .then(function(response){
          Vue.set(show,"listItem",response.data)
        })
    },
    mounted: function(){
      let listenList = document.getElementById('listForm')
      listenList.addEventListener('ajax:success', function(data){
        let listData = data.detail[0]
        let length = show.listItem.length 
        Vue.set(show.listItem,length,listData)
        Vue.set(show,"message","LIST新增成功")
      });
      listenList.addEventListener('ajax:error', function(data){
        let listData = data.detail[0]
        Vue.set(show,"message",listData.title[0])
      });
    },
    components: {
      ListView,
      ListCreate
    }
  })
})

// import App from '../templete/createlist.vue'
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()

//   console.log(app.$el)
//   console.log(app)
// })