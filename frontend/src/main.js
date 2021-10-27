import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import CoreuiVue from "@coreui/vue-pro";
import { CIcon } from '@coreui/icons-vue'
import { iconsSet as icons } from '@/assets/icons'
import DocsCallout from '@/components/DocsCallout'
import DocsExample from '@/components/DocsExample'

//import Vue from 'vue'
//Vue.prototype.$server_url = 'http://127.0.0.1:5000'

const app = createApp(App)
app.use(store)
app.use(router)
app.use(CoreuiVue)
app.provide('icons', icons)
app.component('CIcon', CIcon)
app.component('DocsCallout', DocsCallout)
app.component('DocsExample', DocsExample)

app.mount('#app')
