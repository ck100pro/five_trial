const state = {
  messages: ""
};

const mutations = {
  addMessage(state, response) {
    state.messages = response
  }
};

export default {
  namespaced: true,
  state, mutations
};