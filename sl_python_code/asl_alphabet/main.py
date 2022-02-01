# -*- coding: utf-8 -*-
import numpy as np
import tensorflow as tf
from tensorflow import keras
import cv2

CATEGORIES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

#========== MODELO ==========

model = keras.models.model_from_json(open("model/model_complete.json", "r").read())
model.load_weights("model/model_complete.h5")

#========== CONSTANTES ==========

font = cv2.FONT_HERSHEY_SIMPLEX
org = (2,30)
fontScale = 1
color = (0,0,0)
thickness = 2
lineType = 2


#========== CÁMARA ==========

cam = cv2.VideoCapture(0,cv2.CAP_DSHOW)
while True:
    ret, frame = cam.read()
    frame3 = frame
    frame2 = cv2.flip(frame, 1)
    cv2.imshow("Camera", frame2)
    resized = cv2.resize(frame3, (200, 200), interpolation = cv2.INTER_AREA)
    gray = resized / 255.0
    prediction_image = frame3
   
    batch = (np.expand_dims(gray,0))

			
    #Predecir la letra con el modelo
    predictions_single = model.predict(batch)
    predictions = predictions_single[0]
    index = np.argmax(predictions_single[0])
    text= "{}: {:.2f}%".format(CATEGORIES[index], predictions[index] * 100)
    cv2.putText(prediction_image, text, org, font, fontScale, color,thickness)
    cv2.imshow("Prediction", prediction_image)
    print("\r{} {} {}".format(CATEGORIES[index], frame.shape, predictions[index]), end = "")
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cam.release()
cv2.destroyAllWindows()
