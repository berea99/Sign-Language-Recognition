# -*- coding: utf-8 -*-
import numpy as np
import tensorflow as tf
from tensorflow import keras
import cv2

CATEGORIES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

# MODELO ------------

model = keras.models.model_from_json(open("model/model.json", "r").read())
model.load_weights("model/model.h5")



# ABRIR CAMARA --------------

cam = cv2.VideoCapture(0)
azulBajo = np.array([0,30,60],np.uint8)
azulAlto = np.array([20,150,255],np.uint8)

while True:
    ret, frame = cam.read()
    frame3=frame
    if ret:
        frame2 = cv2.flip(frame, 1)
        cv2.imshow("Camera", frame2)
        frameHSV = cv2.cvtColor(frame,cv2.COLOR_BGR2HSV)
        #segmentar por color de piel
        mask = cv2.inRange(frameHSV,azulBajo,azulAlto)
        #coger los contornos
        contornos,hierarchy = cv2.findContours(mask,cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        for c in contornos:
            area = cv2.contourArea(c)
            if area > 3000:
                x,y,w,h=cv2.boundingRect(c)
                if y>30:
                    #Recortar la imagen para detectar mejor la mano
                    frame3=frame[y-30:y+h,x:x+w]
                    if x>30:
                        frame3=frame[y-30:y+h+30,x-30:x+w+30]
                else:
                    frame3=frame[y:y+h,x:x+w]
                frame3=cv2.cvtColor(frame3, cv2.COLOR_HSV2BGR)
# Transformar imatge a 28x28 grayscale
    cv2.imshow("Contornos", frame3)       
    resized = cv2.resize(frame3, (28, 28), interpolation = cv2.INTER_AREA)

    gray = cv2.cvtColor(resized, cv2.COLOR_BGR2GRAY) / 255.0

    cv2.imshow("Frame", gray)

    batch = (np.expand_dims(gray,0))

# Aplicar modelo

    predictions_single = model.predict(batch)


    index = np.argmax(predictions_single[0])

    print("\r{} {}".format(CATEGORIES[index], frame.shape), end = "")



    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cam.release()
cv2.destroyAllWindows()
