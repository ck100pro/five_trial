const state = {
  cardCreateItem: NaN,
  listActionMenu: {
    view: false,
    listId: NaN,
    offsetTop: 0,
    offsetLeft: 0
  }
}

const mutations = {
  cardCreateItem(state, response) {
    state.cardCreateItem = response
  },
  listActionMenu(state, response) {
    console.log("1")
    state.listActionMenu = response
  }
}
export default {
  namespaced: true,
  state, mutations
};