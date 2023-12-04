import json
import urllib2

# The IP address should be the address of the machine where the server is running.
server_url = 'http://10.211.55.10:5000/nao'

# Here, we're sending a simple dictionary as data.
data_to_send = {
    'key1': 'value1',
    'key2': 'value2'
}

# Convert the dictionary to a JSON string before sending.
json_data = json.dumps(data_to_send)

# Create the request object with the server URL and the JSON data as the body.
req = urllib2.Request(server_url, json_data, headers={'Content-Type': 'application/json'})

# Make the POST request and get the response.
response = urllib2.urlopen(req)

# Read the response
response_text = response.read()

# Print the response text (or perform any other necessary actions)
print(response_text)