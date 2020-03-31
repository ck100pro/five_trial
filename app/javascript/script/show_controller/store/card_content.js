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
    state.cardContent = response
    state.cardContentView = true
  },
  closeContent(state) {
    state.cardContentView = false
  }
}

const actions = {
  getCardContent({ commit, rootGetters }, response) {
    let cardContent = rootGetters["getAllItem/getCardContent"](response)
    commit("settingContent", response)
    commit("cardContent", cardContent)
    // axios.get(`/cards/${state.cardId}.json`)
    //   .then(function (response) {
    //     commit("cardContent", response)
    //   });
  },
  updateCardTime({ commit }, time) {
    axios
      .patch(`/cards/${state.cardId}.json`, {
        card: {
          endtime_at: time
        }
      })
      .then(function (response) {
        commit("getAllItem/updateCardTime", response.data, { root: true })
      });
  }
}

export default {
  namespaced: true,
  state, mutations, actions
}