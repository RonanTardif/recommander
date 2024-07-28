# src/inference.py

import pickle

# Charger le modèle pré-entraîné
model_path = 'model/recommender_model.pkl'
with open(model_path, 'rb') as file:
    model = pickle.load(file)

def recommend(user_data):
    # Implémenter la logique de recommandation ici
    recommendations = model.predict(user_data)
    return recommendations
