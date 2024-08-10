from flask import Flask, request, jsonify
import subprocess
import os

app = Flask(__name__)

@app.route('/deploy', methods=['POST'])
def deploy():
    try:
        data = request.get_json()
        commit_id = data.get('commit_id')
        branch = data.get('branch')

        if not commit_id or not branch:
            return jsonify({'error': 'commit_id and branch are required'}), 400

        # Use the correct path to deploy.sh
        script_path = os.path.join(os.getcwd(), 'scripts', 'deploy.sh')
        
        # Check if the script exists before attempting to execute
        if not os.path.isfile(script_path):
            return jsonify({'error': f'Script not found: {script_path}'}), 500
        
        # Call the deployment script with commit_id and branch as arguments
        subprocess.check_call([script_path, commit_id, branch])
        return jsonify({'message': 'Deployment triggered successfully'}), 200
    except subprocess.CalledProcessError as e:
        return jsonify({'error': str(e)}), 500
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8969, debug=False)
