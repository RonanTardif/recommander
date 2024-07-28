# src/app.py

from flask import Flask, request, jsonify
from inference import recommend

app = Flask(__name__)

@app.route('/recommend', methods=['POST'])
def recommend_route():
    user_data = request.json
    recommendations = recommend(user_data)
    return jsonify(recommendations)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
