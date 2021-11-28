import pathlib

from flask import Flask

UPLOAD_FOLDER = pathlib.Path.cwd() / "static"


app = Flask(__name__,  static_folder=UPLOAD_FOLDER)
