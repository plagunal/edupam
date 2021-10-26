<template>
  <CSidebar
    position="fixed"
    color-scheme="light"
    :unfoldable="sidebarUnfoldable"
    :visible="sidebarVisible"
    @visible-change="
      (event) =>
        $store.commit({
          type: 'updateSidebarVisible',
          value: event,
        })
    "
  >
    <CSidebarBrand>
      <CIcon
        customClassName="sidebar-brand-full"
        :icon="logoNegative"
        :height="35"
      />
      <CIcon
        customClassName="sidebar-brand-narrow"
        :icon="sygnet"
        :height="35"
      />
    </CSidebarBrand>
    <CSidebarNav>
      <router-link to="./compose" custom v-slot="{ href, navigate, isActive }">
        <CNavItem :active="isActive" :href="href" @click="navigate">
          <CIcon customClassName="nav-icon" icon="cil-pencil" />
          Compose
        </CNavItem>
      </router-link>
      <router-link to="./inbox" custom v-slot="{ href, navigate, isActive }">
        <CNavItem :active="isActive" :href="href" @click="navigate">
          <CIcon customClassName="nav-icon" icon="cil-inbox" />
          Inbox
          <CBadge class="ms-auto" color="danger">4</CBadge>
        </CNavItem>
      </router-link>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" icon="cil-star" />
        Stared
      </CNavItem>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" icon="cil-paper-plane" />
        Sent
      </CNavItem>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" icon="cil-trash" />
        Trash
      </CNavItem>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" icon="cil-bookmark" />
        Important
        <CBadge class="ms-auto" color="info">5</CBadge>
      </CNavItem>
      <CNavItem href="#">
        <CIcon customClassName="nav-icon" icon="cil-inbox" />
        Spam
        <CBadge class="ms-auto" color="warning">25</CBadge>
      </CNavItem>
      <router-link to="/dashboard" custom v-slot="{ href, navigate, isActive }">
        <CNavItem :active="isActive" class="mt-auto" :href="href" @click="navigate">
          <CIcon customClassName="nav-icon" icon="cil-speedometer" />
          Dashboard
          <CBadge class="ms-auto" color="info">NEW</CBadge>
        </CNavItem>
      </router-link>
    </CSidebarNav>
    <CSidebarToggler
      class="d-none d-lg-flex"
      @click="$store.commit('toggleUnfoldable')"
    />
  </CSidebar>
</template>

<script>
import { computed } from 'vue'
import { useStore } from 'vuex'
import { logoNegative } from '@/assets/brand/logo-negative'
import { sygnet } from '@/assets/brand/sygnet'
export default {
  name: 'EmailSidebar',
  setup() {
    const store = useStore()
    return {
      logoNegative,
      sygnet,
      sidebarUnfoldable: computed(() => store.state.sidebarUnfoldable),
      sidebarVisible: computed(() => store.state.sidebarVisible),
    }
  },
}
</script>
