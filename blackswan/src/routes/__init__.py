
from flask import Blueprint, Response, abort, request, url_for
from src.routes.ml_model_2 import process_URL

app_routes = Blueprint("app_routes", "api")

@app_routes.post("/process-model")
def process_model():
  requestJson = request.get_json()
  reqDataType = requestJson['data_type']

  file_content, impact_score, sentiment = process_URL(reqDataType)

  return {
    'file_content': file_content,
    'impact_score': impact_score,
    'sentiment': sentiment
  }
