document.addEventListener('turbolinks:load', () => {
    // const app = new Vue({
    //   render: h => h(App)
    // }).$mount()
    // document.body.appendChild(app.$el)
  
    // console.log(app)
    const createBoard = new Vue({
      el: "#createBoard",
      data: {
        boardVisible: false
      }
    })
  })