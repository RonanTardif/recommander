# tests/test_inference.py

import pytest
from src.inference import recommend

def test_recommend():
    user_data = {"feature": "value"}
    # Assurez-vous d'avoir un modèle de test qui peut gérer ces données
    recommendations = recommend(user_data)
    assert isinstance(recommendations, list)
