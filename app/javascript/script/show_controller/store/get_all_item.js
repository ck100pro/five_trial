const state = {
  allItem: undefined
};

const mutations = {
  addAllItem(state, response) {
    state.allItem = response.data
  },
  addList(state, response) {
    state.allItem.push(response.data)
  },
  addCard(state, response) {
    state.allItem[response.index].card.push(response)
  },
  deleteCard(state, response) {
    state.allItem[response.listIndex].card.splice(response.cardIndex)
  },
  listTitleUpdate(state, response) {
    state.allItem[response.index].title = response.title
  }
};

const actions = {
  getAllItem({ commit }) {
    let path = location.pathname
    let url = path + ".json"
    axios.get(`${url}`)
      .then(function (response) {
        commit("addAllItem", response)
      })
  }
}

export default {
  namespaced: true,
  state, mutations, actions
};