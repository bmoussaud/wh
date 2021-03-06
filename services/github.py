from github_webhook import Webhook
from flask import Flask
import json

app = Flask(__name__)  # Standard Flask app
webhook = Webhook(app) # Defines '/postreceive' endpoint

@app.route("/")        # Standard Flask endpoint
def hello_world():
    print (" hello world by benoit")
    return "Hello, World!"

@webhook.hook()        # Defines a handler for the 'push' event
def on_push(data):
    print("Got push with: {0}".format(data))

if __name__ == "__main__":
    app.run(port=5001, debug=True)

