<template>
  <CHeader position="sticky" class="mb-4">
    <CContainer fluid>
      <CHeaderToggler class="ps-1" @click="$store.commit('toggleSidebar')">
        <CIcon icon="cil-menu" size="lg" />        
      </CHeaderToggler>
      <!--<CHeaderBrand class="mx-auto d-lg-none" to="/">
        <CIcon :icon="logo" height="48" alt="Logo" />        
      </CHeaderBrand>-->
      <CHeaderNav class="d-none d-md-flex me-auto">
        <CNavItem>
          <CNavLink href="/dashboard"> Dashboard </CNavLink>
        </CNavItem>
        <CNavItem>
          <CNavLink href="#">Users</CNavLink>
        </CNavItem>
        <CNavItem>
          <CNavLink href="#">Settings</CNavLink>
        </CNavItem>
      </CHeaderNav>
      <CHeaderNav class="ms-auto me-4">
        <CButtonGroup aria-label="Theme switch">
          <CFormCheck
            type="radio"
            :button="{ color: 'primary' }"
            name="theme-switch"
            id="btn-light-theme"
            autoComplete="off"
            :checked="$store.state.theme === 'default'"
            @change="
              (event) =>
                $store.commit({
                  type: 'toggleTheme',
                  value: 'default',
                })
            "
          >
            <template #label><CIcon icon="cil-sun" /></template>
          </CFormCheck>
          <CFormCheck
            type="radio"
            :button="{ color: 'primary' }"
            name="theme-switch"
            id="btn-dark-theme"
            autoComplete="off"
            :checked="$store.state.theme === 'dark'"
            @change="
              (event) =>
                $store.commit({
                  type: 'toggleTheme',
                  value: 'dark',
                })
            "
          >
            <template #label><CIcon icon="cil-moon" /></template>
          </CFormCheck>
        </CButtonGroup>
      </CHeaderNav>
      <CHeaderNav class="me-4">
        <AppHeaderDropdownNotif />
        <AppHeaderDropdownTasks />
        <AppHeaderDropdownMssgs />
      </CHeaderNav>
      <CHeaderNav class="ms-3 me-4">
        <AppHeaderDropdownAccnt />
      </CHeaderNav>
      <CHeaderToggler class="px-md-0 me-md-3">
        <CIcon
          icon="cil-applications-settings"
          size="lg"
          @click="$store.commit('toggleAside')"
        />
      </CHeaderToggler>
    </CContainer>
    <CHeaderDivider />
    <CContainer fluid>
      <CBreadcrumb class="d-md-down-none me-auto mb-0">
        <CBreadcrumbItem
          v-for="item in breadcrumbs"
          :href="item.to"
          :active="item.to === '' ? true : false"
          :key="item"
        >
          {{ item.name }}
        </CBreadcrumbItem>
      </CBreadcrumb>
    </CContainer>
  </CHeader>
</template>

<script>
import { onMounted, ref } from 'vue'
import { onBeforeRouteUpdate } from 'vue-router'
import AppHeaderDropdownAccnt from './AppHeaderDropdownAccnt'
import AppHeaderDropdownMssgs from './AppHeaderDropdownMssgs'
import AppHeaderDropdownNotif from './AppHeaderDropdownNotif'
import AppHeaderDropdownTasks from './AppHeaderDropdownTasks'
import router from '@/router'
import { logo } from '@/assets/brand/logo'
import logo_img from '@/assets/images/logo.png'

export default {
  name: 'AppHeader',
  components: {
    AppHeaderDropdownAccnt,
    AppHeaderDropdownMssgs,
    AppHeaderDropdownNotif,
    AppHeaderDropdownTasks
    
  },
  setup() {
    const upperCaseFirstChar = (string) =>
      string.substr(0, 1).toUpperCase() + string.substr(1)

    const makeCurrentRoute = () => {
      let result = [{ to: '/', name: 'Home' }]
      let path = router.currentRoute._value.path
      let temp = path.split('/')
      let to = ''
      if (temp.length <= 2) {
        result.push({ to: '', name: router.currentRoute._value.name })
      } else {
        for (let i = 1; i < temp.length - 1; i++) {
          for (let j = 1; j <= i; j++) {
            to += `/${temp[j]}`
          }
          result.push({ to: to, name: upperCaseFirstChar(temp[i]) })
        }
        result.push({ to: '', name: router.currentRoute._value.name })
      }
      return result
    }

    const breadcrumbs = ref([])

    onBeforeRouteUpdate(() => {
      breadcrumbs.value = makeCurrentRoute()
    })

    onMounted(() => {
      breadcrumbs.value = makeCurrentRoute()
    })

    return {
      breadcrumbs,
      logo,
      avatar: logo_img
    }
  },
}
</script>
