import os
import pathlib

from flask import Blueprint, Flask, Response, abort, request, url_for

from ml_model import process_URL

UPLOAD_FOLDER = pathlib.Path.cwd() / "static"

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
  
if __name__ == "__main__":
	app.run(
		host=os.environ.get("FLASK_HOST") or "0.0.0.0",
		debug=os.environ.get("FLASK_ENV") == "development",
	)
