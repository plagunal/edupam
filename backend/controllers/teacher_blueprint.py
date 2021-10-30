from flask import Flask
from flask import Blueprint
from flask import request
from flask import jsonify

from flask_cors import CORS, cross_origin # para que no genere errores de CORS al hacer peticiones

from backend.models.teacher_model import teacherModel

teacher_blueprint = Blueprint('teacher_blueprint', __name__)

model = teacherModel()

@teacher_blueprint.route('/teacher/create', methods=['POST'])
@cross_origin()
def create():
    content = model.create(request.json)    
    return jsonify(content)

@teacher_blueprint.route('/teacher/delete', methods=['POST'])
@cross_origin()
def delete():
    return jsonify(model.delete(int(request.json['id'])))

@teacher_blueprint.route('/teacher/get', methods=['POST'])
@cross_origin()
def get():
    return jsonify(model.get(int(request.json['id'])))

@teacher_blueprint.route('/teacher/get_all', methods=['POST'])
@cross_origin()
def get_all():
    return jsonify(model.get_all())