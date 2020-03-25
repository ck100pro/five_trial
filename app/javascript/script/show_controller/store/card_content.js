const state = {
  cardContentView: false,
  cardContent: null
}

const mutations = {
  cardContent(state, response) {
    state.cardContent = response.data
    state.cardContentView = true
    console.log(state.cardContent)
  },
  closeContent(stat, response) {
    state.cardContentView = false
  }
}

const actions = {
  getCardContent({ commit }, cardId) {
    axios.get(`/cards/${cardId}.json`)
    .then(function(response) {
      commit("cardContent", response)
    });
  }
}

export default {
  namespaced: true,
  state, mutations ,actions
}