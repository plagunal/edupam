<template>
  

  <CRow>

    <CCol :xs="12">
      <CCard class="mb-4">
        <CCardHeader> <strong>Cycle</strong> <small>list</small> </CCardHeader>
        <CCardBody>
          
          <CSmartTable
            clickableRows
            :tableProps="{
              striped: true,
              hover: true,
            }"
            :items="items"
            :columns="columns"
            columnFilter
            tableFilter
            cleaner
            itemsPerPageSelect
            :itemsPerPage="5"
            columnSorter
            pagination
          >

          <template #col_edit="{item}">
            <td class="py-2">
              <CButton
                color="primary"
                variant="outline"
                square
                size="sm"
                @click="edit(item)"
              >
                Edit
              </CButton>
            </td>
          </template>

          <template #active="{item}">
            <td><CBadge :color="getBadge(item.active)">{{item.active}}</CBadge></td>
          </template>
            

         </CSmartTable>
        </CCardBody>
      </CCard>
    </CCol>


    <CCol :xs="12">      
      <CCard>
        <CCardHeader> <strong>Cycle</strong> new/edit </CCardHeader>
        <CCardBody>
          <!--<p>
            Cycle details.
          </p>-->
          <div class="bd-example bd-example-type">
            <CTable>
              <CTableBody>
                <CTableRow>
                  <CTableDataCell>


                  <CForm class="row g-3" @submit="add">
                     
                      <CCol xs="6">
                        <CFormLabel for="inputCycle">Name</CFormLabel>
                        <CFormInput id="inputName" name="inputName" required/>
                      </CCol>

                      <CCol xs="6">
                        <CFormLabel for="inputType">Type</CFormLabel>
                        <CFormSelect id="inputType" name="inputType" required>
                          <option v-for="t in types" :value="t.text" :key="t.value">{{t.text}}</option>                          
                        </CFormSelect>
                        <!--<CMultiSelect optionsStyle="text" :multiple="false" id="inputType" name="inputType" required >
                          <option v-for="t in types" :value="t.text" :key="t.value">{{t.text}}</option>                          
                        </CMultiSelect>-->
                      </CCol>   

                      <CCol xs="6">
                        <CFormLabel for="inputSchedule">Schedule</CFormLabel>
                        <CFormSelect id="inputSchedule"  name="inputSchedule" required>
                          <option v-for="t in schedules" :value="t.text" :key="t.value">{{t.text}}</option>                          
                        </CFormSelect>
                      </CCol>                    

                      <CCol xs="6">
                        <CFormLabel for="inputState">State</CFormLabel>
                        <CFormCheck type="checkbox" id="inputActive" name="inputActive" label="Active"/>
                      </CCol>

                      <CCol xs="12">
                      <CFormInput type="file" id="inputFile" name="inputFile" aria-label="file example"  />                      
                      </CCol> 

                      <CCol xs="12">
                        <CButton color="primary" type="submit">Save</CButton>
                      </CCol>
                    </CForm>   
                  
                  </CTableDataCell>
                </CTableRow>
                
                
              </CTableBody>
            </CTable>
          </div>
        </CCardBody>
      </CCard>    
      
    </CCol>




  </CRow>



</template>

<script>
import axios from 'axios'
import global_params from './_params'

export default {
  data: () => {
      return {       
        columns: [
          {
            key: 'col_edit',
            label: '',
            _style: { width: '1%' },
            filter: false,
            sorter: false,
            _props: { color: 'primary', className: 'fw-semibold'}
          }, 'name', 'type', 'schedule', 'active' 
        ],
        details: [],
        items: [{id:null, name:null, id_type:null, type:null, id_schedule:null, schedule:null, active_val: null, active:null}],        
        current_item: {},
        schedules:[],
        types:[],
        postURL: 'http://127.0.0.1:5000',
        config_request: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
        } 
      }
    },
    methods: {
      getBadge (active) {
        switch (active) {
          case 'Active': return 'success'
          case 'Inactive': return 'danger'
          default: 'primary'
        }
      },
      edit(item){
        this.current_item = item;
        console.log(this.current_item);
      },
      add(event){ 
        event.preventDefault();
        console.log(event);
        var elements = event.target.elements;
        this.current_item.name = elements.inputName.value;
        this.current_item.id_type = this.types[elements.inputType.selectedIndex].value;
        this.current_item.type = elements.inputType.value;
        this.current_item.id_schedule = this.schedules[elements.inputSchedule.selectedIndex].value;
        this.current_item.schedule = elements.inputSchedule.value;
        this.current_item.active_val = (( elements.inputActive.checked ) ? 1 : 0);
        this.current_item.active = (( elements.inputActive.checked ) ? "Active" : "Inactive");
        

        console.log(this.current_item);
        
        axios.post(global_params.server + '/cycle/create', this.current_item, this.config_request)
        .then(res => {                                         
            this.items.unshift(res.data);
        })
        .catch((error) => {
            console.log(error)
        });
      }
    },
    created(){ 
    //mounted(){ 
      axios.post(global_params.server + '/cycle/get_all')
            .then((res) => { this.items = res.data;})
            .catch((error) => { console.log(error) });

      axios.post(global_params.server + '/utils/get_all_schedules')
            .then((res) => { this.schedules = res.data; })
            .catch((error) => { console.log(error) });

      axios.post(global_params.server + '/cycle/get_cycle_type')
            .then((res) => { this.types = res.data; })
            .catch((error) => { console.log(error) });
    }    
  }
</script>
