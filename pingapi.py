import json
import requests

url = "https://reqres.in/api/users?page=2"
my_headers = {
    'Authorization': 'XXXXX',
}
data = { 
    "q": {
        "name": {
            "eq": "0aslam0"
        }
    }
}
r = requests.get(url, headers=my_headers, json=data)
print(r)