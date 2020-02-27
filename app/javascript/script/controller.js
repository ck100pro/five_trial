import ListView from "../templete/listview.vue"

document.addEventListener('DOMContentLoaded', () => {
new Vue({
    el: "#controllerItems",
    data: {
      boardVisible: false
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        if (targetId == "list-show" || targetId == "list-cancel"){
          this.boardVisible = !this.boardVisible
          console.log(controllerItems)
        } else {
          this.boardVisible = false
        }
      },
      onc: function(){
        console.log("123")
      }
    },
    components: {
      ListView
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