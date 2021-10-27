from backend.models.connection_pool import MySQLPool

class UtilsModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()    

    def get_all_schedules(self):
        rv = self.mysql_pool.execute("""
        SELECT id, name FROM Schedule""")                
        data = []
        content = {}
        for result in rv:
            content = {
                    'value': int(result[0]), 
                    'text': result[1]                ,
                    'id': int(result[0]), 
                    'name': result[1]
                }
            data.append(content)
            content = {}
        return data

    def create_schedule(self, json):    
        params = {
            'name' : json['name']
        }  
        query = """insert into Schedule(name)
            values (%(name)s)"""    
        cursor = self.mysql_pool.execute(query, params, commit=True)   
        
        json["id"] = cursor.lastrowid       
        return json