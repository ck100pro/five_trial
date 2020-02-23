document.addEventListener('DOMContentLoaded', () => {
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