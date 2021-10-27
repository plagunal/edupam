from flask import Flask
from flask import Blueprint
from flask import request
from flask import jsonify

from flask_cors import CORS, cross_origin # para que no genere errores de CORS al hacer peticiones

from backend.models.cycle_model import CycleModel

cycle_blueprint = Blueprint('cycle_blueprint', __name__)

model = CycleModel()

@cycle_blueprint.route('/cycle/create', methods=['POST'])
@cross_origin()
def create():
    content = model.create(request.json)    
    return jsonify(content)

@cycle_blueprint.route('/cycle/create_cycle_type', methods=['POST'])
@cross_origin()
def create_cycle_type():
    content = model.create_cycle_type(request.json)    
    return jsonify(content)

@cycle_blueprint.route('/cycle/delete', methods=['POST'])
@cross_origin()
def delete():
    return jsonify(model.delete(int(request.json['id'])))

@cycle_blueprint.route('/cycle/get', methods=['POST'])
@cross_origin()
def get():
    return jsonify(model.get(int(request.json['id'])))

@cycle_blueprint.route('/cycle/get_all', methods=['POST'])
@cross_origin()
def get_all():
    return jsonify(model.get_all())

@cycle_blueprint.route('/cycle/get_cycle_type', methods=['POST'])
@cross_origin()
def get_cycle_type():
    return jsonify(model.get_cycle_type())

