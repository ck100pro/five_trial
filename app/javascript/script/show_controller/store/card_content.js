const state = {
  cardContentView: false,
  cardContent: null
}

const actions = {
  getCardContent({ commit }, cardId) {
    axios.get(`/cards/${cardId}.json`)
    .then(function(response) {
      console.log(response)
    });
  }
}

export default {
  namespaced: true,
  state, actions
}