from flask import Flask, request

app = Flask(__name__)

@app.route('/nao', methods=['POST'])
def nao_endpoint():
    data = request.json
    # Process the data sent from NAO
    return 'Received'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

