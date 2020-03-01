require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import '@fortawesome/fontawesome-free/css/all.css'
import Vue from 'vue/dist/vue.esm'
import axios from "../helpers/axios.js"

global.Vue = Vue;
global.axios = axios;