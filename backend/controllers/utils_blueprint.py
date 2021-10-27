from flask import Flask
from flask import Blueprint
from flask import request
from flask import jsonify

from flask_cors import CORS, cross_origin # para que no genere errores de CORS al hacer peticiones

from backend.models.utils_model import UtilsModel

utils_blueprint = Blueprint('utils_model', __name__)

model = UtilsModel()

@utils_blueprint.route('/utils/get_all_schedule', methods=['POST'])
@cross_origin()
def get_all_schedulle():
    return jsonify(model.get_all_schedulle())


