document.addEventListener('DOMContentLoaded', () => {
  const controllerItems = new Vue({
    el: "#controllerItems",
    data: {
      boardVisible: false
    },
    methods: {
      onclick: function(event){
        let targetId = event.target.id
        if (targetId == "list-show" || targetId == "list-cancel"){
          this.boardVisible = !this.boardVisible
        } else {
          this.boardVisible = false
        }
      }
    }
  })
})