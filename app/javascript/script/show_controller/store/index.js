import Vuex from 'vuex'
import getAllItem_module from './getallitem.js'
import addMessages_module from './messages.js'

export default new Vuex.Store({
  modules: {
    getAllItem: getAllItem_module,
    addMessages: addMessages_module
  }
});