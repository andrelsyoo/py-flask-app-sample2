from flask import Flask, jsonify, request

app = Flask(__name__)

# Route for "/hello"
@app.route('/hello')
def hello():
    response_data = {"message": "Hello, World!"}
    return jsonify(response_data), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
