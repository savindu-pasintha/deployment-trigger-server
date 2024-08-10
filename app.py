from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/deploy', methods=['POST'])
def deploy():
    try:
        # Call the deployment script
        subprocess.check_call(['/scripts/deploy.sh'])
        return jsonify({'message': 'Deployment triggered successfully'}), 200
    except subprocess.CalledProcessError as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8969, debug=False)
