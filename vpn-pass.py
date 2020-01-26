#!/bin/python3
import requests

url = 'https://freevpn.im/accounts/'
try:
    r = requests.get(url)
except:
    exit(-1)

data = r.text

start = data.find('<b>Password')+len('<b>Password: </b>')
end   = data.find('<', start)
print(data[start:end])
