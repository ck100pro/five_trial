import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"

document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    data: {
      listItem: null,
      listMessage: null
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        if (targetId != "listButton"){
          this.$refs.ListCreate.visible = true
        }
      }
    },
    created: function(){
      let path = location.pathname
      let url = path + ".json"
      axios.get(`${url}`)
        .then(function(response){
          console.log(response)
          Vue.set(show,"listItem",response.data)
        })
    },
    mounted: function(){
      let listenList = document.getElementById('listForm')
      listenList.addEventListener('ajax:success', function(data){
        console.log(data)
        let listData = data.detail[0]
        let length = show.listItem.length 
        Vue.set(show.listItem,length,listData)
        Vue.set(show,"listMessage","新增成功")
      });
      listenList.addEventListener('ajax:error', function(data){
        Vue.set(show,"listMessage","新增失敗")
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