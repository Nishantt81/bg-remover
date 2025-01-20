FROM python:3.9

# Download and copy the ONNX model to avoid unnecessary downloads in the container
COPY u2net.onnx /home/.u2net/u2net.onnx

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Explicitly install onnxruntime
RUN pip install --no-cache-dir onnxruntime

# Copy the application code into the container
COPY . .

# Expose the desired port
EXPOSE 5100

# Set the default command to run the app
CMD ["python", "app.py"]
