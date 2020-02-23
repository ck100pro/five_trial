document.addEventListener('turbolinks:load', () => {
    // const app = new Vue({
    //   render: h => h(App)
    // }).$mount()
    // document.body.appendChild(app.$el)
  
    // console.log(app)
    const boardItems = new Vue({
      el: "#boardItems",
      data: {
        boardVisible: false
      },
      methods: {
        a(){
          return console.log(this.boardVisible)
        }
      }
    })
  })