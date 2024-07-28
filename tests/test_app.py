# tests/test_app.py

import pytest
from src.app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_recommend_route(client):
    response = client.post('/recommend', json={"feature": "value"})
    assert response.status_code == 200
    assert isinstance(response.json, list)
