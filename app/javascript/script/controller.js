import ListView from "../templete/listview.vue"
import ListCreate from "../templete/listcreate.vue"

document.addEventListener('DOMContentLoaded', () => {
new Vue({
    el: "#controllerItems",
    data: {
      boardVisible: true,
      title: undefined
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        console.log(this.title)
        if (targetId != "listButton"){
          this.$refs.ListCreate.visible = true
        }
      }
    },
    create: function(){

    },
    mounted: function(){
      document.getElementById('test').addEventListener('ajax:success', function(data){
        let listData = data.detail[0] 
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