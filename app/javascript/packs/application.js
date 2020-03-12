require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import '@fortawesome/fontawesome-free/css/all.css'
import Vue from 'vue/dist/vue.esm'
import axios from "../helpers/axios.js"
import Vuex from 'vuex'

global.Vue = Vue;
global.axios = axios;

Vue.use(Vuex)