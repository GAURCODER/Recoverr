from flask import Flask, request, jsonify
import numpy as np
import requests
import tensorflow as tf
from PIL import Image
from io import BytesIO

app = Flask(__name__)

# Load labels
with open("labels.txt", "r") as f:
    labels = f.read().splitlines()

@app.route('/predict', methods=['POST'])
def predict():
    try:
        if request.method == 'POST':
            # Load TFLite model and allocate tensors.
            interpreter = tf.lite.Interpreter(model_path="model_unquant.tflite")
            interpreter.allocate_tensors()

            # Get input and output tensors.
            input_details = interpreter.get_input_details()
            output_details = interpreter.get_output_details()

            # Get image URL from request
            image_url = request.json['imageUrl']

            # Download image from URL
            response = requests.get(image_url)
            img = Image.open(BytesIO(response.content))

            # Preprocess image if necessary
            img = img.resize((224, 224))  # replace with model's input size
            input_data = np.array(img, dtype=np.float32)

            input_data = np.expand_dims(input_data, axis = 0)

            # Set input tensor
            interpreter.set_tensor(input_details[0]['index'], input_data)

            # Run inference
            interpreter.invoke()

            # Get output tensor
            output_data = interpreter.get_tensor(output_details[0]['index'])

            # Postprocess output data 
            predicted_label_index = np.argmax(output_data)

            # index to get the corresponding label from labels.txt file
            predicted_label = labels[predicted_label_index]

            # delete output data
            if 'output_data' in locals():
                del output_data

            print("Predicted label", predicted_label)

            # Return response
            return jsonify({"predicted_label": predicted_label})

    except Exception as e:
        print(f"An error occurred: {e}")
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
