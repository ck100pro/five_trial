const state = {
  cardContentView: false,
  cardContent: null,
  cardId: null,
  cardIndex: null,
  listIndex: null
}

const mutations = {
  settingContent(state, response) {
    state.cardId = response.cardId
    state.cardIndex = response.cardIndex
    state.listIndex = response.listIndex
  },
  cardContent(state, response) {
    state.cardContent = response.data
    state.cardContentView = true
  },
  closeContent(stat, response) {
    state.cardContentView = false
  }
}

const actions = {
  getCardContent({ commit }, response) {
    commit("settingContent", response)
    axios.get(`/cards/${state.cardId}.json`)
      .then(function (response) {
        commit("cardContent", response)
      });
  },
  updateCardTime({ commit }, time) {
    axios
      .patch(`/cards/${state.cardId}.json`, {
        card: {
          endtime_at: time
        }
      })
      .then(function (response) {
        console.log(response)
      });
  }
}

export default {
  namespaced: true,
  state, mutations, actions
}