import json

from flask import Response, abort, request, url_for
from flask import Blueprint

app_routes = Blueprint("app_routes", "api")

@app_routes.post("/process-model")
def process_model():
  requestJson = request.get_json()
  reqUrl = requestJson['req_url']

  # TODO: I will Integrate ML code here

  return 'Request processed!'
