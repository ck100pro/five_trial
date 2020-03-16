import Vuex from 'vuex'
import getAllItem_module from './getallitem.js'

export default new Vuex.Store({
  modules: {
    getAllItem: getAllItem_module,
  }
});