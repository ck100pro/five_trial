import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"
import Axios from "axios"

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
    created: function(){
      let path = location.pathname
      let pathJson = path + ".json"
      axios.get(`${pathJson}`)
        .then(function(response){
          console.log(response)
          Vue.set(show,"listItem",response.data)
        })
    },
    mounted: function(){
      document.getElementById('listForm').addEventListener('ajax:success', function(data){
        console.log(data)
        let listData = data.detail[0]
        if (listData.status == "error"){
          Vue.set(show,"listMessage","新增失敗")
          console.log(show.listItem)
        } else {
          let length = show.listItem.length 
          Vue.set(show.listItem,length,listData)
          Vue.set(show,"listMessage","新增成功")
          // show.listItem.push(listData)
          // console.log(show.listMessage)
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