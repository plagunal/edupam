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
            :itemsPerPage="50"
            columnSorter
            pagination
          >
          <template #attend_text="{item}">
            <td><CBadge :color="getBadge(item.attend_text)">{{item.attend_text}}</CBadge></td>
          </template>
          <template #col_edit="{item}">
            <td class="py-2">
              <CButton
                color="primary"
                variant="outline"
                square
                size="sm"
                @click="edit(item)"
              >
                Change
              </CButton>
            </td>
          </template>     

         </CSmartTable>
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
          }, 'attend_text', 'first_name', 'last_name', 'date'
        ],
        details: [],
        items: [{id_student:null, first_name:null, last_name:null, id:null, date:null, attend:null, attend_text:null}],        
        current_item: {},
        config_request: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
        } 
      }
    },
    methods: {  
      getBadge (active) {
        switch (active) {
          case 'Present': return 'success'
          case 'Absent': return 'danger'
          default: 'primary'
        }
      },    
      edit(item){
        console.log(item);
        item.attend = (item.attend == 1) ? 0 : 1;
        item.attend_text = (item.attend_text == 'Present') ? 'Absent' : 'Present';
        this.current_item = item;
        
        console.log(this.current_item);
        
        axios.post(global_params.server + '/attendance/update', this.current_item, this.config_request)
        .then(res => { })
        .catch((error) => {
            console.log(error)
        });
        
      }      
    },
    created(){  

      axios.post(global_params.server + '/attendance/get')
            .then((res) => { this.items = res.data; })
            .catch((error) => { console.log(error) });
    }    
  }
</script>
