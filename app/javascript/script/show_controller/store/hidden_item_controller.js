const state = {
  cardCreateItem: NaN,
  listActionMenu: {
    view: false,
    listId: NaN,
    offectTop: 0,
    offectLeft: 0
  }
}

const mutations = {
  cardCreateItem(state, response) {
    state.cardCreateItem = response
  },
  listActionMenu(state, response) {
    state.listActionMenu = response
  }
}
export default {
  namespaced: true,
  state, mutations
};