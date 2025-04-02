import json
import requests
import time
  
with open('requests-rest.json', 'r') as json_file:
  data = json.load(json_file);
  #print(requests)
for request in data["requests"]:
  print(request['id'])
  
print("App started")
i = 1
while True:
  print("This driver is actually alive: {0}".format(i))
  for request in data["requests"]:
    print("Executing Request "+str(request['id'])+": {0}".format(i))
    r = requests.get(request['url'], headers=request['header'], json=request['data'])    
    print("Printing Response "+str(request['id'])+": {0}".format(r.json()))  
  
  timer = request['timer']
  print("Pause time is: {0}".format(timer))
  time.sleep(timer)
  i += 1