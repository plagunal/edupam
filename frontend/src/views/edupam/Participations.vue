<template>
  

  <CRow>

    <CCol :xs="12">
      <CCard class="mb-4">
        <CCardHeader> <strong>Student</strong> <small>list</small> </CCardHeader>
        <CCardBody>
          
          <CSmartTable
            clickableRows
            :tableProps="{
              striped: true,
              hover: true,
              columnFilter:false
            }"
            :items="items"
            :columns="columns"
            
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

         </CSmartTable>
        </CCardBody>
      </CCard>
    </CCol>


    <CCol :xs="12">      
      <CCard>
        <CCardHeader> <strong>Student</strong> new/edit </CCardHeader>
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
                     
                      <CCol md="6">
                        <CFormLabel for="inputFirstName">First Name</CFormLabel>
                        <CFormInput id="inputFirstName" name="inputFirstName" required/>
                      </CCol>
                      <CCol md="6">
                        <CFormLabel for="inputLastName">Last Name</CFormLabel>
                        <CFormInput id="inputLastName" name="inputLastName" required/>
                      </CCol>
                      <CCol md="6">
                        <CFormLabel for="inputCode">Student Code</CFormLabel>
                        <CFormInput id="inputCode" name="inputCode" required/>
                      </CCol>
                      <CCol md="6">
                        <CFormLabel for="inputDNI">DNI</CFormLabel>
                        <CFormInput id="inputDNI" name="inputDNI" required/>
                      </CCol>
                      <CCol md="6">
                        <CFormLabel for="inputCellPhone">Cell phone</CFormLabel>
                        <CFormInput id="inputCellPhone" name="inputCellPhone" required/>
                      </CCol>
                      <CCol md="6">
                        <CFormLabel for="inputDob">Date of Birth</CFormLabel>
                        <CFormInput type="date" id="inputDob" name="inputDob" required/>
                      </CCol>
                      <CCol md="12">
                        <CFormLabel for="inputOcupation">Ocupation</CFormLabel>
                        <CFormInput id="inputOcupation" name="inputOcupation" required/>
                      </CCol>
                     

                      <CCol xs="12">
                        <CButton color="primary" type="submit">Create</CButton>
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
          }, 'code', 'first_name', 'last_name', 'dob', 'ocupation'
        ],
        details: [],
        items: [{id:null, first_name:null, last_name:null, dob:null, dni:null, ocupation:null}],        
        current_item: {},        
        postURL: 'http://127.0.0.1:5000',
        config_request: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
        } 
      }
    },
    methods: {      
      edit(item){
        this.current_item = item;
        console.log(this.current_item);
      },
      add(event){ 
        event.preventDefault();        
        var elements = event.target.elements;
        this.current_item.first_name = elements.inputFirstName.value;
        this.current_item.last_name = elements.inputLastName.value;
        this.current_item.code = elements.inputCode.value;
        this.current_item.dni = elements.inputDNI.value;
        this.current_item.cell_phone = elements.inputCellPhone.value;
        this.current_item.dob = elements.inputDob.value;
        this.current_item.ocupation = elements.inputOcupation.value;

        console.log(this.current_item);
        
        axios.post(global_params.server + '/student/create', this.current_item, this.config_request)
        .then(res => {                                         
            this.items.unshift(res.data);
        })
        .catch((error) => {
            console.log(error)
        });
      }
    },
    created(){  

      axios.post(global_params.server + '/student/get_all')
            .then((res) => { this.items = res.data; })
            .catch((error) => { console.log(error) });
    }    
  }
</script>
