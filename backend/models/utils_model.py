from backend.models.connection_pool import MySQLPool

class UtilsModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()    

    def get_all_schedulle(self):
        rv = self.mysql_pool.execute("""
        SELECT id, name FROM Schedule""")                
        data = []
        content = {}
        for result in rv:
            content = {
                    'value': int(result[0]), 
                    'text': result[1]                
                }
            data.append(content)
            content = {}
        return data

   