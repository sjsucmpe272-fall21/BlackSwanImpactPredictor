import os

from flask import url_for

from src.app import app
from src.routes import app_routes


@app.get("/")
def hello_world():
    return "Hello world!"


app.register_blueprint(app_routes, url_prefix="/api")

if __name__ == "__main__":
    app.run(
        host=os.environ.get("FLASK_HOST") or "127.0.0.1",
        debug=os.environ.get("FLASK_ENV") == "development",
    )