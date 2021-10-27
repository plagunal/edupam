from flask import Flask
from flask import request
from flask import jsonify
from flask import render_template
from flask_cors import CORS, cross_origin # para que no genere errores de CORS al hacer peticiones

from backend.controllers.student_blueprint import student_blueprint
from backend.controllers.utils_blueprint import utils_blueprint
from backend.controllers.cycle_blueprint import cycle_blueprint
from backend.controllers.attendance_blueprint import attendance_blueprint

app = Flask(__name__)
# para que utilice vue compilado ( npm run build ). En la carpeta dist, esta lo compilado de vue
#app = Flask(__name__,
#            static_folder = "./frontend/dist/static",
#            template_folder = "./frontend/dist")

app.register_blueprint(student_blueprint)
app.register_blueprint(utils_blueprint)
app.register_blueprint(cycle_blueprint)
app.register_blueprint(attendance_blueprint)

cors = CORS(app)

'''
@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def dender_vue(path):
    return render_template("index.html")
'''
if __name__ == "__main__":
    app.run(debug=True, port=5003)