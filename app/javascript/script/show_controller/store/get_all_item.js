const state = {
  allItem: undefined
};

const getters = {
  getCardContent: function (state) {
    let allItem = state.allItem
    return function (response) {
      let targetList = allItem.find(element => element.id === response.listId)
      let targetCard = targetList.card.find(element => element.id === response.cardId)
      return targetCard
    }
  }
}

const mutations = {
  addAllItem(state, response) {
    state.allItem = response.data
  },
  addList(state, response) {
    state.allItem.push(response.data)
  },
  addCard(state, response) {
    let targetList = state.allItem.find(element => element.id === response.list_id)
    targetList.card.unshift(response)
  },
  updateCardTime(state, response) {
    let targetList = state.allItem.find(element => element.id === response.list_id)
    let targetCard = targetList.card.find(element => element.id === response.id)
    targetCard.endtime_at = response.endtime_at
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
    let url = location.pathname + ".json"
    axios.get(`${url}`)
      .then(function (response) {
        commit("addAllItem", response)
      })
  }
}

export default {
  namespaced: true,
  state, mutations, actions, getters
};