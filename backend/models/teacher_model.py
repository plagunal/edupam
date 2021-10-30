from backend.models.connection_pool import MySQLPool
import datetime

class teacherModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()

    def get(self, id):    
        params = {'id' : id}      
        rv = self.mysql_pool.execute("SELECT id, first_name, last_name, dni from Teacher where id=%(id)s", params)                
        data = []
        content = {}
        for result in rv:
            content = {
                    'id': result[0], 
                    'first_name': result[1],
                    'last_name': result[2], 
                    'dni': result[3]
        
                }
            data.append(content)
            content = {}
        return data

    def get_all(self):  
        rv = self.mysql_pool.execute("SELECT id, first_name, last_name, dni from Teacher")  
        data = []
        content = {}
        for result in rv:
            content = {
                    'id': result[0], 
                    'first_name': result[1],
                    'last_name': result[2], 
                    'dni': result[3]
        
                }
            data.append(content)
            content = {}
        return data

   