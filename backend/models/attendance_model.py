from backend.models.connection_pool import MySQLPool
import datetime

class AttendanceModel:
    def __init__(self):        
        self.mysql_pool = MySQLPool()

    def get(self):  
        rv = self.mysql_pool.execute("""
        SELECT A.id_student, S.first_name, S.last_name, A.id, A.date_a, A.attend 
        FROM Attendance as A INNER JOIN Student as S ON S.id = A.id_student 
        WHERE A.date_a = CURRENT_DATE()""")                
        data = []
        attend_list = ['Absent', 'Present']
        content = {}
        for result in rv:
            content = {
                    'id_student': result[0], 
                    'first_name': result[1],
                    'last_name': result[2], 
                    'id': result[3], 
                    'date': result[4].strftime("%Y-%m-%d"), 
                    'attend': result[5],
                    'attend_text': attend_list[result[5]]
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

    def update(self, json):    
        params = {
            'id' : json['id'],
            'attend' : json['attend']
        }  
        query = """UPDATE Attendance SET attend = %(attend)s WHERE id = %(id)s"""    
        cursor = self.mysql_pool.execute(query, params, commit=True)  
        
        return json

    
