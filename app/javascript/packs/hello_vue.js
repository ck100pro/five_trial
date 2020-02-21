/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
  // const app = new Vue({
  //   render: h => h(App)
  // }).$mount()
  // document.body.appendChild(app.$el)

  // console.log(app)
// })


// If the project is using turbolinks, install 'vue-turbolinks':
// yarn add vue-turbolinks
// Then uncomment the code block below:

import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import CreateBoard from '../templete/createboard.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  // const app = new Vue({
  //   render: h => h(App)
  // }).$mount()
  // document.body.appendChild(app.$el)

  // console.log(app)
  const createBoard = new Vue({
    el: "#createBoard",
    methods: {
      boardView: function(event){
        console.log(event)
      }
    }
  })
})
