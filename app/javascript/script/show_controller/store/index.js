import Vuex from 'vuex'
import getAllItem_module from './get_all_item.js'
import addMessages_module from './messages.js'
import hiddenItemController_module from './hidden_item_controller.js'
import cardContent_module from './card_content.js'

export default new Vuex.Store({
  modules: {
    getAllItem: getAllItem_module,
    addMessages: addMessages_module,
    hiddenItemController: hiddenItemController_module,
    cardContent: cardContent_module
  }
});