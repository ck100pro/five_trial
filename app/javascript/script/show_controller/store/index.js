import Vuex from 'vuex'

const allItem = {
  state: {
    allItem: undefined
  },
  mutations: {
    addAllItem(state, allItem) {
      state.allItem = allItem.data
    }
  },
  actions: {
    getAllItem({commit}) {
      let path = location.pathname
      let url = path + ".json"
      axios.get(`${url}`)
        .then(function(response){
          commit("addAllItem", response)
      })
    }
  }
}

export default new Vuex.Store({
  modules: {
    allItem
  }
});