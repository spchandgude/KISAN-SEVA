import requests

url = 'http://localhost:5000/predict_api'
r = requests.post(url,json={'temperature':2, 'humidity':9, 'ph':6, 'rainfall':200})

print(r.json())
