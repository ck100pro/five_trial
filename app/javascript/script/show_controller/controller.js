import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"

document.addEventListener('DOMContentLoaded', () => {
let vue = new Vue({
    el: "#controllerItems",
    data: {
      boardVisible: true,
      listItem: undefined
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        console.log(this.listItem.length)
        console.log(this.listItem)
        if (targetId != "listButton"){
          this.$refs.ListCreate.visible = true
        }
      }
    },
    mounted: function(){
      document.getElementById('test').addEventListener('ajax:success', function(data){
        let listData = data.detail[0]
        let listLength = vue.listItem.length
        Vue.set(vue.listItem, listLength, listData)
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