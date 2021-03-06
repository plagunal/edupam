from backend.models.connection_pool import MySQLPool
import datetime

class StudentModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()

    def get(self, id):    
        params = {'id' : id}      
        rv = self.mysql_pool.execute("SELECT id, first_name, last_name, dni, dob, cell_phone, ocupation from Student where id=%(id)s", params)                
        data = []
        content = {}
        for result in rv:
            content = {
                    'id': result[0], 
                    'first_name': result[1],
                    'last_name': result[2], 
                    'dni': result[3], 
                    'dob': result[4], 
                    'cell_phone': result[5], 
                    'ocupation': result[6]
                }
            data.append(content)
            content = {}
        return data

    def get_all(self):  
        rv = self.mysql_pool.execute("SELECT id, first_name, last_name, dni, code, dob, cell_phone, ocupation from Student")  
        data = []
        content = {}
        for result in rv:
            content = {
                    'id': result[0], 
                    'first_name': result[1],
                    'last_name': result[2], 
                    'dni': result[3], 
                    'code': result[4], 
                    #'dob': result[5].strftime("%Y-%m-%d"),
                    'dob': result[5].strftime("%m-%d-%Y"),
                    'cell_phone': result[6], 
                    'ocupation': result[7]
                }
            data.append(content)
            content = {}
        return data

    def create(self, json):    
        params = {
            'first_name' : json['first_name'],
            'last_name' : json['last_name'],
            'dni' : json['dni'],
            'code' : json['code'],
            'dob' : json['dob'],
            'cell_phone' : json['cell_phone'],
            'ocupation' : json['ocupation']
        }  
        query = """insert into Student(first_name, last_name, code, dni, dob, cell_phone, ocupation)
            values (%(first_name)s, %(last_name)s,  %(code)s, %(dni)s,  %(dob)s,  %(cell_phone)s,  %(ocupation)s)"""    
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