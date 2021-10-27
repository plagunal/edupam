from backend.models.connection_pool import MySQLPool
from datetime import date

class CycleModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()    

    def get(self, id):    
        params = {'id' : id}      
        rv = self.mysql_pool.execute("""
        SELECT C.id, C.name as cycle_name, S.name as schedule_name from Cycle as C 
        INNER JOIN Schedule as S ON S.id = C.id_schedule
        where C.id=%(id)s""", params)                
        data = []
        content = {}
        for result in rv:
            content = {
                    'id': result[0], 
                    'cycle_name': result[1],
                    'schedule_name': result[2]                    
                }
            data.append(content)
            content = {}
        return data

    def get_all(self):  
        rv = self.mysql_pool.execute("""
        SELECT C.id, C.name, CT.name as type, S.name as schedule, C.date, C.active ,
        C.id_type, C.id_schedule
        from Cycle as C 
        INNER JOIN Schedule as S ON S.id = C.id_schedule 
        INNER JOIN Cycle_type as CT ON CT.id = C.id_type        
        ORDER BY C.date DESC""")  
        data = []
        content = {}
        status = ['Inactive', 'Active']
        for result in rv:
            content = {
                    'id': result[0], 
                    'name': result[1],
                    'type': result[2], 
                    'schedule': result[3], 
                    'date': result[4], 
                    'active': status[int(result[5])],
                    'active_val': int(result[5]),
                    'id_type': result[6], 
                    'id_schedule': result[7]
                     
                }
            data.append(content)
            content = {}
        return data

    # retorna los tipos de ciclos
    def get_cycle_type(self):  
        rv = self.mysql_pool.execute("""
        SELECT id, name FROM Cycle_type """)  
        data = []
        content = {}
        status = ['Inactive', 'Active']
        for result in rv:
            content = {
                    'value': int(result[0]), 
                    'text': result[1]                     
                }
            data.append(content)
            content = {}
        return data

    def create(self, json):    
        params = {
            'name' : json['name'],
            'type' : json['id_type'],
            'schedule' : json['id_schedule'],
            'active_val' : json['active_val'],
            'c_date': str(date.today())
        }  
        query = """insert into Cycle(name, date, id_type, id_schedule, active)
            values (%(name)s, %(c_date)s,  %(type)s,  %(schedule)s,  %(active_val)s)"""    
        cursor = self.mysql_pool.execute(query, params, commit=True)   
        
        json["id"] = cursor.lastrowid       
        return json

    def delete(self, id):    
        params = {'id' : id}      
        query = """delete from Student where id = %(id)s"""    
        self.mysql_pool.execute(query, params, commit=True)   

        data = {'result': 1}
        return data

if __name__ == "__main__":    
    tm = StudentModel()     

    #print(tm.get_task(1))
    #print(tm.get_tasks())
    #print(tm.delete_task(67))
    #print(tm.get_tasks())
    #print(tm.create_task('prueba 10', 'desde python'))