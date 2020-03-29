import store from "./store"
import { mapState } from "vuex"
import ListView from "./templete/listView.vue"
import ListCreate from "./templete/listCreate.vue"
import CardContent from "./templete/cardContent.vue"

document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    store,
    data: {
      message: undefined,
    },
    methods: {
      resetButton: function(event){
        console.log(event.target.classList)
        console.log("主畫面元素正常觸發中")
      }
    },
    created: function(){
      this.$store.dispatch("getAllItem/getAllItem");
    },
    computed: mapState('addMessages', ['messages']),
    components: {
      ListView,
      ListCreate,
      CardContent
    }
  })
})