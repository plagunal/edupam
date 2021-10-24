from flask import Flask
from flask import Blueprint
from flask import request
from flask import jsonify

from flask_cors import CORS, cross_origin # para que no genere errores de CORS al hacer peticiones

from backend.models.student_model import StudentModel

student_blueprint = Blueprint('student_blueprint', __name__)

model = StudentModel()

@student_blueprint.route('/student/create', methods=['POST'])
@cross_origin()
def create():
    content = model.create(request.json)    
    return jsonify(content)

@student_blueprint.route('/student/delete', methods=['POST'])
@cross_origin()
def delete():
    return jsonify(model.delete(int(request.json['id'])))

@student_blueprint.route('/student/get', methods=['POST'])
@cross_origin()
def get():
    return jsonify(model.get(int(request.json['id'])))

@student_blueprint.route('/student/get_all', methods=['POST'])
@cross_origin()
def get_all():
    return jsonify(model.get_all())

