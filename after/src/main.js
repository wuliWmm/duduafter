// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
Vue.prototype.$ajax = axios
Vue.config.productionTip = false
import Vuex from 'vuex'
Vue.use(Vuex);
const store = new Vuex.Store({
	state:{
		show:true,
		count:0,
		lefttime:0,
		righttime:0,
		singlist:[]

	},mutations:{
		fuzhi(state,id) {
			state.count = id;

		},
		fu(state,aaa) {
			state.show = aaa

		},chuange(state,aaa){
			state.singlist= aaa 
		}
	}
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  template: '<App/>',
  components: { App }
})
