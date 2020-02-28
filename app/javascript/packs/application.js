require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import '@fortawesome/fontawesome-free/css/all.css'
import '../css'
import '../script'
import Vue from 'vue/dist/vue.esm'
import axios from "../helpers/axios"

global.Vue = Vue;
global.axios = axios;