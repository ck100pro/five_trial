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
    let targetList = state.allItem.find( element => element.id === response.list_id)
    targetList.card.unshift(response)
  },
  deleteCard(state, response) {
    state.allItem[response.listIndex].card.splice(response.cardIndex, 1)
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