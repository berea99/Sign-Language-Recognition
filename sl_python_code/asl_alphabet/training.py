# -*- coding: utf-8 -*-
from tensorflow import keras
from tensorflow.keras.models import Sequential
import matplotlib.pyplot as plt
import tensorflow as tf

#========== COMPROBAR GPU DISPONIBLE ==========

print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))

classes = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

#========== DATA PREPROCESS ==========

train_datagen = keras.preprocessing.image.ImageDataGenerator(rescale=1./255,horizontal_flip=True)

test_datagen = keras.preprocessing.image.ImageDataGenerator(rescale=1./255,horizontal_flip=True)

train_generator = train_datagen.flow_from_directory(
    'data/asl_alphabet_train',
    target_size=(200,200),
    batch_size=32,
    class_mode='categorical'
)

test_generator = test_datagen.flow_from_directory(
    'final_data/test',
    target_size=(200,200),
    batch_size=32,
    class_mode='categorical'
)

#========== MODELO ==========

model =Sequential()

model.add(keras.layers.Conv2D(32,(3,3),activation="relu",padding="same",input_shape=(200,200,3)))
model.add(keras.layers.Conv2D(32,(3,3),activation="relu",padding="same"))
model.add(keras.layers.MaxPooling2D(3,3))

model.add(keras.layers.Conv2D(64,(3,3),activation="relu",padding="same"))
model.add(keras.layers.Conv2D(64,(3,3),activation="relu",padding="same"))
model.add(keras.layers.MaxPooling2D(3,3))

model.add(keras.layers.Conv2D(128,(3,3),activation="relu",padding="same"))
model.add(keras.layers.Conv2D(128,(3,3),activation="relu",padding="same"))
model.add(keras.layers.MaxPooling2D(3,3))

model.add(keras.layers.Conv2D(256,(3,3),activation="relu",padding="same"))
model.add(keras.layers.Conv2D(256,(3,3),activation="relu",padding="same"))

model.add(keras.layers.Flatten())

model.add(keras.layers.Dense(512,activation="relu"))
model.add(keras.layers.Dropout(0.5))

model.add(keras.layers.Dense(26,activation="softmax"))

opt = keras.optimizers.Adam(learning_rate=0.0001)
model.compile(optimizer=opt,loss="categorical_crossentropy",metrics=['accuracy'])
model.summary()

#========== ENTRENAR EL MODELO ==========

history = model.fit_generator(
    train_generator,
    epochs=20,
    validation_data=test_generator
)

#========== GRÁFICOS DE EVALUACÓN DEL MODELO ==========

plt.style.use('seaborn')
plt.figure(figsize=(10,10))
plt.plot(history.history['loss'], color='b', label="Training loss")
plt.plot(history.history['val_loss'], color='r', label="Validation loss")
plt.legend()
plt.show()

plt.figure()

plt.figure(figsize=(8,8))
plt.plot(history.history['accuracy'], color='b', label="Training accuracy")
plt.plot(history.history['val_accuracy'], color='r',label="Validation accuracy")
plt.legend()
plt.show()

#========== GUARDAR EL MODELO ==========

model_json = model.to_json()
with open("model/model.json", "w") as json_file:
    json_file.write(model_json)
model.save_weights("model/model.h5")

#========== GUARDAR EL MODELO TFLITE ==========

tf.saved_model.save(model,'model')

converter = tf.lite.TFLiteConverter.from_keras_model(model)
model = converter.convert()
file = open( 'model.tflite' , 'wb' )
file.write( model )