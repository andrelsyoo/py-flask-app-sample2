from flask import Flask, jsonify, request
from datetime import datetime

app = Flask(__name__)

@app.route('/hello')
def hello():
    response_data = {"message": "Hello World!"}
    return jsonify(response_data), 200

@app.route('/current_time')
def current_time():
    name = request.args.get('name', 'Guest')
    timestamp = int(datetime.timestamp(datetime.now()))
    message = f"Hello {name}"
    response_data = {
        "timestamp": timestamp,
        "message": message
    }
    return jsonify(response_data), 200

@app.route('/healthcheck')
def healthcheck():
    return "OK", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
