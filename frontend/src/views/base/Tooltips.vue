<template>
  <CRow>
    <CCol :xs="12">
      <DocsCallout name="Tooltip" href="components/tooltip.html" />
    </CCol>
    <CCol :xs="12">
      <CCard>
        <CCardHeader>
          <strong>Vue Tooltips</strong> <small>Basic example</small>
        </CCardHeader>
        <CCardBody>
          <p class="text-medium-emphasis small">
            Hover over the links below to see tooltips:
          </p>
          <DocsExample href="components/tooltip.html">
            <p class="text-medium-emphasis">
              Tight pants next level keffiyeh
              <CLink v-c-tooltip="'Tooltip text'"> you probably </CLink>
              haven't heard of them. Photo booth beard raw denim letterpress
              vegan messenger bag stumptown. Farm-to-table seitan, mcsweeney's
              fixie sustainable quinoa 8-bit american apparel
              <CLink v-c-tooltip="'Tooltip text'"> have a </CLink>
              terry richardson vinyl chambray. Beard stumptown, cardigans banh
              mi lomo thundercats. Tofu biodiesel williamsburg marfa, four loko
              mcsweeney''s cleanse vegan chambray. A really ironic artisan
              <CLink v-c-tooltip="'Tooltip text'"> whatever keytar </CLink>
              scenester farm-to-table banksy Austin
              <CLink v-c-tooltip="'Tooltip text'"> twitter handle </CLink>
              freegan cred raw denim single-origin coffee viral.
            </p>
          </DocsExample>
          <p class="text-medium-emphasis small">
            Hover over the links below to see tooltips:
          </p>
          <DocsExample href="components/tooltip.html">
            <CButton
              color="secondary"
              v-c-tooltip="{
                content:
                  'Vivamus sagittis lacus vel augue laoreet rutrum faucibus.',
                placement: 'top',
              }"
              >Tooltip on top</CButton
            >
            <CButton
              color="secondary"
              v-c-tooltip="{
                content:
                  'Vivamus sagittis lacus vel augue laoreet rutrum faucibus.',
                placement: 'right',
              }"
              >Tooltip on right</CButton
            >
            <CButton
              color="secondary"
              v-c-tooltip="{
                content:
                  'Vivamus sagittis lacus vel augue laoreet rutrum faucibus.',
                placement: 'bottom',
              }"
              >Tooltip on bottom</CButton
            >
            <CButton
              color="secondary"
              v-c-tooltip="{
                content:
                  'Vivamus sagittis lacus vel augue laoreet rutrum faucibus.',
                placement: 'left',
              }"
              >Tooltip on left</CButton
            >
          </DocsExample>
        </CCardBody>
      </CCard>
    </CCol>
  </CRow>
</template>

<script>
export default {
  name: 'Tooltips',
}
</script>
