from flask import Flask
from flask import Blueprint
from flask import request
from flask import jsonify

from flask_cors import CORS, cross_origin # para que no genere errores de CORS al hacer peticiones

from backend.models.attendance_model import AttendanceModel

attendance_blueprint = Blueprint('attendance_blueprint', __name__)

model = AttendanceModel()

@attendance_blueprint.route('/attendance/update', methods=['POST'])
@cross_origin()
def update():
    content = model.update(request.json)    
    return jsonify(content)

@attendance_blueprint.route('/attendance/get', methods=['POST'])
@cross_origin()
def get():
    return jsonify(model.get())

@attendance_blueprint.route('/attendance/get_all', methods=['POST'])
@cross_origin()
def get_all():
    return jsonify(model.get_all())

