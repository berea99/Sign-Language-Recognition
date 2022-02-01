# -*- coding: utf-8 -*-
import numpy as np
import tensorflow as tf
from tensorflow import keras
import matplotlib as plt
import cv2

CATEGORIES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

#========== MODELO ==========

model = keras.models.model_from_json(open("model/model_complete.json", "r").read())
model.load_weights("model/model_complete.h5")

#========== IMAGE ==========

image_path ='final_data/train/V/V998_0.jpg'


#========== PREDICTION ==========

image = cv2.imread(image_path, cv2.IMREAD_COLOR)
imgplot = plt.pyplot.imshow(image)
plt.pyplot.show()
divide = image / 255.0
batch = (np.expand_dims(divide,0))


predictions_single = model.predict(batch)
predictions = predictions_single[0]
index = np.argmax(predictions_single[0])
print("\r{} {} {}".format(CATEGORIES[index], image.shape, predictions[index]), end = "")