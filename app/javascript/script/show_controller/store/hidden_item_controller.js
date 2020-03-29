const state = {
  cardCreateItem: NaN,
  listActionItem: false
}

const mutations = {
  cardCreateItem(state, response) {
    console.log(response)
    state.cardCreateItem = response
  }
}

export default {
  namespaced: true,
  state, mutations
};