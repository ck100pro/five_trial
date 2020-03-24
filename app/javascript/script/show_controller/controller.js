import store from "./store"
import { mapState } from "vuex"
import ListView from "./templete/listview.vue"
import ListCreate from "./templete/listcreate.vue"
import CardContent from "./templete/cardcontent.vue"

document.addEventListener('DOMContentLoaded', () => {
let show = new Vue({
    el: "#controllerShow",
    store,
    data: {
      message: undefined,
    },
    methods: {
      resetButton: function(event){
        console.log("正常觸發中")
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