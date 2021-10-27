<template>
  <CSidebar
    colorScheme="light"
    selfHiding="xxl"
    size="lg"
    overlaid
    placement="end"
    :visible="asideVisible"
  >
    <CSidebarHeader class="bg-transparent p-0">
      <CNav variant="underline">
        <CNavItem>
          <CNavLink href="#" @click="updateActiveKey(1)">
            <CIcon icon="cil-List" alt="CoreUI Icons List" />
          </CNavLink>
        </CNavItem>
        <CNavItem>
          <CNavLink href="#" @click="updateActiveKey(2)">
            <CIcon icon="cil-speech" alt="CoreUI Icons Speech" />
          </CNavLink>
        </CNavItem>
        <CNavItem>
          <CNavLink href="#" @click="updateActiveKey(3)">
            <CIcon icon="cil-settings" alt="CoreUI Icons Settings" />
          </CNavLink>
        </CNavItem>
        <CNavItem class="ms-auto me-2 d-flex align-items-center">
          <CCloseButton @click="$store.commit('toggleAside')"/>
        </CNavItem>
      </CNav>
    </CSidebarHeader>
    <CTabContent>
      <CTabPane :visible="activeKey == 1">
        <CListGroup flush>
          <CListGroupItem
            class="
              list-group-item
              border-start-4 border-start-secondary
              bg-light
              text-center
              fw-bold
              text-medium-emphasis text-uppercase
              small
            "
          >
          Students
          </CListGroupItem>
          <CListGroupItem href="#" class="border-start-4 border-start-warning">
            <CAvatar :src="avatar2" size="lg" class="float-end" />
            <div>Student 1 <strong>Lucas</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 1 point
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilCheckCircle" /> Present
            </small>
          </CListGroupItem>

          <CListGroupItem href="#" class="border-start-4 border-start-info">
            <CAvatar :src="avatar3" size="lg" class="float-end" />
            <div>Student 2 <strong>Megan</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 2 points
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilCheckCircle" /> Present
            </small>
          </CListGroupItem>

          <CListGroupItem href="#" class="border-start-4 border-start-info">
            <CAvatar :src="avatar4" size="lg" class="float-end" />
            <div>Student 3 <strong>Julia</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 2 points
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilCheckCircle" /> Present
            </small>
          </CListGroupItem>

          <CListGroupItem href="#" class="border-start-4 border-start-info">
            <CAvatar :src="avatar5" size="lg" class="float-end" />
            <div>Student 4 <strong>Claudio</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 4 points
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilCheckCircle" /> Present
            </small>
          </CListGroupItem>

          <CListGroupItem href="#" class="border-start-4 border-start-info">
            <CAvatar :src="avatar6" size="lg" class="float-end" />
            <div>Student 5 <strong>Joel</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 2 points
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilCheckCircle" /> Present
            </small>
          </CListGroupItem>

          <CListGroupItem href="#" class="border-start-4 border-start-info">
            <CAvatar :src="avatar7" size="lg" class="float-end" />
            <div>Student 6 <strong>Vicente</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 0 points
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilXCircle" /> Absent
            </small>
          </CListGroupItem>

          <CListGroupItem href="#" class="border-start-4 border-start-info">
            <CAvatar :src="avatar8" size="lg" class="float-end" />
            <div>Student 7 <strong>Enrique</strong></div>
            <small class="text-medium-emphasis me-3">
              <CIcon icon="cilCheck" /> 3 points
            </small>
            <small class="text-medium-emphasis">
              <CIcon icon="cilCheckCircle" /> Present
            </small>
          </CListGroupItem>


          <CListGroupItem
            class="
              border-start-4 border-start-secondary
              bg-light
              text-center
              fw-bold
              text-medium-emphasis text-uppercase
              small
            "
          >            
          </CListGroupItem>
          
        </CListGroup>
      </CTabPane>
      <CTabPane class="p-3" :visible="activeKey == 2">
        <div class="message">
          <div class="py-3 pb-5 me-3 float-start">
            <CAvatar :src="avatar7" status="success" size="md" />
          </div>
          <div>
            <small class="text-medium-emphasis">Lukasz Holeczek</small>
            <small class="text-medium-emphasis float-end mt-1">1:52 PM</small>
          </div>
          <div class="text-truncate fw-semibold">
            Lorem ipsum dolor sit amet
          </div>
          <small class="text-medium-emphasis">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt...
          </small>
        </div>
        <hr />
        <div class="message">
          <div class="py-3 pb-5 me-3 float-start">
            <CAvatar :src="avatar7" status="success" size="md" />
          </div>
          <div>
            <small class="text-medium-emphasis">Lukasz Holeczek</small>
            <small class="text-medium-emphasis float-end mt-1">1:52 PM</small>
          </div>
          <div class="text-truncate fw-semibold">
            Lorem ipsum dolor sit amet
          </div>
          <small class="text-medium-emphasis">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt...
          </small>
        </div>
        <hr />
        <div class="message">
          <div class="py-3 pb-5 me-3 float-start">
            <CAvatar :src="avatar7" status="success" size="md" />
          </div>
          <div>
            <small class="text-medium-emphasis">Lukasz Holeczek</small>
            <small class="text-medium-emphasis float-end mt-1">1:52 PM</small>
          </div>
          <div class="text-truncate fw-semibold">
            Lorem ipsum dolor sit amet
          </div>
          <small class="text-medium-emphasis">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt...
          </small>
        </div>
        <hr />
        <div class="message">
          <div class="py-3 pb-5 me-3 float-start">
            <CAvatar :src="avatar7" status="success" size="md" />
          </div>
          <div>
            <small class="text-medium-emphasis">Lukasz Holeczek</small>
            <small class="text-medium-emphasis float-end mt-1">1:52 PM</small>
          </div>
          <div class="text-truncate fw-semibold">
            Lorem ipsum dolor sit amet
          </div>
          <small class="text-medium-emphasis">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt...
          </small>
        </div>
        <hr />
        <div class="message">
          <div class="py-3 pb-5 me-3 float-start">
            <CAvatar :src="avatar7" status="success" size="md" />
          </div>
          <div>
            <small class="text-medium-emphasis">Lukasz Holeczek</small>
            <small class="text-medium-emphasis float-end mt-1">1:52 PM</small>
          </div>
          <div class="text-truncate fw-semibold">
            Lorem ipsum dolor sit amet
          </div>
          <small class="text-medium-emphasis">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
            eiusmod tempor incididunt...
          </small>
        </div>
      </CTabPane>
      <CTabPane class="p-3" :visible="activeKey == 3">
        <h6>Settings</h6>
        <div>
          <div class="clearfix mt-4">
            <CFormSwitch
              size="lg"
              label="Option 1"
              id="Option1"
              defaultChecked
            />
          </div>
          <div>
            <small class="text-medium-emphasis">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </small>
          </div>
        </div>
        <div>
          <div class="clearfix mt-3">
            <CFormSwitch size="lg" label="Option 2" id="fOption2" />
          </div>
          <div>
            <small class="text-medium-emphasis">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
              eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </small>
          </div>
        </div>
        <div>
          <div class="clearfix mt-3">
            <CFormSwitch size="lg" label="Option 3" id="Option3" />
          </div>
        </div>
        <div>
          <div class="clearfix mt-3">
            <CFormSwitch
              size="lg"
              label="Option 4"
              id="Option4"
              defaultChecked
            />
          </div>
        </div>
        <hr />
        <h6>System Utilization</h6>
        <div class="text-uppercase mb-1 mt-4">
          <small>
            <b>CPU Usage</b>
          </small>
        </div>
        <CProgress thin color="info-gradient" :value="25" />
        <small class="text-medium-emphasis">348 Processes. 1/4 Cores.</small>
        <div class="text-uppercase mb-1 mt-2">
          <small>
            <b>Memory Usage</b>
          </small>
        </div>
        <CProgress thin color="warning-gradient" :value="70" />
        <small class="text-medium-emphasis">11444GB/16384MB</small>
        <div class="text-uppercase mb-1 mt-2">
          <small>
            <b>SSD 1 Usage</b>
          </small>
        </div>
        <CProgress thin color="danger-gradient" :value="95" />
        <small class="text-medium-emphasis">243GB/256GB</small>
        <div class="text-uppercase mb-1 mt-2">
          <small>
            <b>SSD 2 Usage</b>
          </small>
        </div>
        <CProgress thin color="success-gradient" :value="10" />
        <small class="text-medium-emphasis">25GB/256GB</small>
      </CTabPane>
    </CTabContent>
  </CSidebar>
</template>

<script>
import { computed, ref } from 'vue'
import { useStore } from 'vuex'
import avatar2 from '@/assets/images/avatars/2.jpg'
import avatar3 from '@/assets/images/avatars/3.jpg'
import avatar4 from '@/assets/images/avatars/4.jpg'
import avatar5 from '@/assets/images/avatars/5.jpg'
import avatar6 from '@/assets/images/avatars/6.jpg'
import avatar7 from '@/assets/images/avatars/7.jpg'
import avatar8 from '@/assets/images/avatars/8.jpg'

export default {
  name: 'AppAside',
  setup() {
    const activeKey = ref(1)

    const updateActiveKey = (key) => {
      activeKey.value = key
    }

    const store = useStore()

    return {
      asideVisible: computed(() => store.state.asideVisible),
      avatar2,
      avatar3,
      avatar4,
      avatar5,
      avatar6,
      avatar7,
      avatar8,
      activeKey,
      updateActiveKey,
    }
  },
}
</script>
