const state = {
  messages: ""
};

const mutations = {
  addMessage(state, response) {
    console.log(response)
    state.messages = response
  }
};

export default {
  namespaced: true,
  state, mutations
};