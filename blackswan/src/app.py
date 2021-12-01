import pathlib
from flask import Blueprint, Response, abort, request, url_for
from routes.ml_model_2 import process_URL

from flask import Flask

UPLOAD_FOLDER = pathlib.Path.cwd() / "static"
# app_routes = Blueprint("app_routes", "api")

cached_data = {}

app = Flask(__name__, static_folder=UPLOAD_FOLDER)

@app.route("/api/process-model", methods=['POST'])
def process_model():
  requestJson = request.get_json()
  reqDataType = requestJson['data_type']

  if(reqDataType in cached_data):
    file_content, impact_score, sentiment = cached_data[reqDataType]
  else:
    file_content, impact_score, sentiment = process_URL(reqDataType)
    cached_data[reqDataType] = file_content, impact_score, sentiment

  return {
    'file_content': file_content,
    'impact_score': impact_score,
    'sentiment': sentiment
  }
