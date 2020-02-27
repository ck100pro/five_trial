import ListView from "../templete/listview.vue"
import ListCreate from "../templete/listcreate.vue"

document.addEventListener('DOMContentLoaded', () => {
new Vue({
    el: "#controllerItems",
    data: {
      boardVisible: true
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        if (targetId != "listButton"){
          this.$refs.ListCreate.visible = true
        }
      }
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