<template>
  <CCallout color="info" class="bg-white dark:bg-dark">
    A Vue {{ name }} component {{ plural ? 'have' : 'has' }} been created as a
    native Vue.js version of Bootstrap {{ name }}. {{ name }}
    {{ plural ? 'are' : 'is' }}
    delivered with some new features, variants, and unique design that matches
    CoreUI Design System requirements.
    <br />
    <br />
    For more information please visit our official
    <CLink :href="href" target="_blank">
      documentation of CoreUI Components Library for Vue.js
    </CLink>
    .
  </CCallout>
</template>

<script>
import packageJson from '../../package.json'
export default {
  name: 'DocsCallout',
  props: {
    href: {
      type: String,
      default: undefined,
      required: false,
    },
    name: {
      type: String,
      default: undefined,
      required: false,
    },
    plural: Boolean,
  },
  setup(props) {
    const href = `https://coreui.io/vue/docs/${packageJson.config.coreui_library_short_version}/${props.href}`

    return {
      href,
    }
  },
}
</script>
