const state = {
  cardContentView: false,
  cardContent: null,
  cardId: null
}

const mutations = {
  cardId(state, response) {
    state.cardId = response
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
  getCardContent({ commit }, cardId) {
    commit("cardId", cardId)
    axios.get(`/cards/${cardId}.json`)
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