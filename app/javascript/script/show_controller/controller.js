import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"

document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    data: {
      listItem: undefined,
      listMessage: undefined
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        console.log(this.listItem)
        if (targetId != "listButton"){
          this.$refs.ListCreate.visible = true
        }
      }
    },
    mounted: function(){
      document.getElementById('listForm').addEventListener('ajax:success', function(data){
        console.log(data)
        let status = data.detail[0].status
        if (status == "error"){
          console.log(message)
          show.listMessage = "新增失敗"
        } else {
          let listData = data.detail[0]
          let listLength = show.listItem.length
          Vue.set(show.listItem, listLength, listData)
          show.listMessage = "新增成功"
        }
      }) 
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