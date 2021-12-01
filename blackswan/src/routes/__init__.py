
# from flask import Blueprint, Response, abort, request, url_for
# from ml_model_2 import process_URL

# app_routes = Blueprint("app_routes", "api")

# cached_data = {}

# @app_routes.post("/process-model")
# def process_model():
#   requestJson = request.get_json()
#   reqDataType = requestJson['data_type']

#   if(reqDataType in cached_data):
#     file_content, impact_score, sentiment = cached_data[reqDataType]
#   else:
#     file_content, impact_score, sentiment = process_URL(reqDataType)
#     cached_data[reqDataType] = file_content, impact_score, sentiment

#   return {
#     'file_content': file_content,
#     'impact_score': impact_score,
#     'sentiment': sentiment
#   }
