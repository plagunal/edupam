<template>
  

  <CRow>

    <CCol :xs="12">
      <CCard class="mb-4">
        <CCardHeader> <strong>Cycle type (levels)</strong> <small>list</small> </CCardHeader>
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
        <CCardHeader> <strong>Cycle type</strong> new/edit </CCardHeader>
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
                     
                      <CCol xs="12">
                        <CFormLabel for="inputName">Name</CFormLabel>
                        <CFormInput id="inputName" name="inputName" required/>
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
          }, 'name'
        ],
        details: [],
        items: [{id:null, name:null}],        
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
        document.getElementById("inputName").value = this.current_item.name;
        
      },
      add(event){ 
        event.preventDefault();        
        var elements = event.target.elements;
        this.current_item.name = elements.inputName.value;

        console.log(this.current_item);
        
        axios.post(global_params.server + '/cycle/create_cycle_type', this.current_item, this.config_request)
        .then(res => {                                         
            this.items.unshift(res.data);
        })
        .catch((error) => {
            console.log(error)
        });
      }
    },
    created(){  

      axios.post(global_params.server + '/cycle/get_cycle_type')
            .then((res) => { this.items = res.data; })
            .catch((error) => { console.log(error) });
    }    
  }
</script>
