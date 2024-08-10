# Use the official Python image as a base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variables, if needed

# Expose the port on which your Flask app runs
EXPOSE 8969

# Define the command to run your Flask application
CMD ["python", "app.py"]
