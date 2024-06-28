from flask import Flask, request, jsonify
import socket
import configparser
import os
app = Flask(__name__)

@app.route('/push', methods=['POST'])
def push_data():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No data received"}), 400

    # Here, you can add the logic to handle the received data
    # For example, print the data or perform some action
    print(f"Data received: {data}")
    return jsonify({"status": "success", "data": data}), 200

def get_ip_address():
    try:
        # Connect to an external server to get the local IP address
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.settimeout(0)
        s.connect(('8.8.8.8', 1))
        ip_address = s.getsockname()[0]
        s.close()
    except Exception:
        ip_address = '127.0.0.1'
    return ip_address

def set_server_ip_to_config():
    config_path = "../config/config.ini"
    # Get the directory of the current script
    #script_dir = os.path.dirname(os.path.abspath(__file__))
    # Construct the path to the configuration file
    config = configparser.ConfigParser()
    config.read(config_path)  # Move these constant paths into a constant.ini file if necessary.

    # Check if the configuration file exists
    if not config.read(config_path):
        print(f"Configuration file {config_path} not found.")
        return

    # Ensure 'server' section exists
    if 'server' not in config:
        print("'server' section not found in the configuration file.")
        return

    ip = get_ip_address()
    if ip is not None:
        config["server"]["host"] = str(ip)
        with open(config_path, 'w') as configfile:
            config.write(configfile)
        print(f"Updated the host to: {ip}")
    else:
        print("Unable to get IP address")

if __name__ == '__main__':
    set_server_ip_to_config()
    app.run(host='0.0.0.0', port=5000)
