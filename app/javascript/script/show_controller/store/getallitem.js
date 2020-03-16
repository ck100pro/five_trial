const state = { 
  allItem: undefined 
};

const mutations = {
  addAllItem(state, response) {
    state.allItem = response.data
  },
  addList(state, response) {
    state.allItem.push(response.data)
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