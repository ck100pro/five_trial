const state = {
  cardViewController: NaN
}

const mutations = {
  cardCreateViewController(state, response) {
    console.log(response)
    state.cardViewController = response
  }
}

export default {
  namespaced: true,
  state, mutations
};