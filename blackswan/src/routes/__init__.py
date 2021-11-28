
from flask import Blueprint, Response, abort, request, url_for

from src.routes.ml_model import process_URL

app_routes = Blueprint("app_routes", "api")

@app_routes.post("/process-model")
def process_model():
  requestJson = request.get_json()
  reqUrl = requestJson['req_url']

  filename = process_URL(reqUrl)

  return url_for('static', filename=filename, _external=True)
