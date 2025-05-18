import Vue from 'vue'
import Vuex from 'vuex'
import app from './modules/app'
import user from './modules/user'
import tagsView from './modules/tagsView'
import permission from './modules/permission'
import settings from './modules/settings'
import getters from './getters'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    uucode: '',
    username: "",
    nickName: "",
    uid: ""
  },
  mutations: {
    set_uucode(state, uucode) {
      state.uucode = uucode
      sessionStorage.setItem("uucode", uucode);
    },
    set_uid(state, uid){
      state.uid =uid
      sessionStorage.setItem("uid",uid);
    },
    set_nickName(state, nickName){
      state.nickName = nickName
      sessionStorage.setItem("nickName",nickName);
    },
    set_username(state, username) {
      state.username = username
      sessionStorage.setItem("username", username);
    },
    del_token(state) {
      state.uucode = ''
      state.username = ''
      state.nickName = ''
      state.uid = ''
      sessionStorage.removeItem('uucode')
      sessionStorage.removeItem('username')
      sessionStorage.removeItem('nickName')
      sessionStorage.removeItem('uid')
    }
  },
  modules: {
    app,
    user,
    tagsView,
    permission,
    settings
  },
  getters
})

export default store
