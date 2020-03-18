import Vuex from 'vuex'
import getAllItem_module from './get_all_item.js'
import addMessages_module from './messages.js'
import cardCreateViewController_module from './card_create_view_controller.js'

export default new Vuex.Store({
  modules: {
    getAllItem: getAllItem_module,
    addMessages: addMessages_module,
    cardCreateViewController: cardCreateViewController_module
  }
});