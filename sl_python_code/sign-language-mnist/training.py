# -*- coding: utf-8 -*-
import tensorflow as tf
from tensorflow import keras

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# ================== DEFINIR CONSTANTS ============================0


EPOCHS = 1
VERBOSE = 1
VALIDATION_SPLIT = 0.2
BATCH_SIZE = 64
RANDOM_SEED = 0

FOLDER_ROOT = './../'
FOLDER_INPUT = FOLDER_ROOT + '/input'
FOLDER_OUTPUT = FOLDER_ROOT + '/output'

# ===========================
# ===========================

IMG_WIDTH = 28
IMG_HEIGHT = 28
IMG_DEPTH = 1

INPUT_SHAPE = (IMG_WIDTH, IMG_HEIGHT, 1)

CATEGORIES = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'Q', 'V', 'W', 'X', 'Y', 'Z']

train = pd.read_csv("sign-language-mnist/sign_mnist_train.csv")
test = pd.read_csv("sign-language-mnist/sign_mnist_test.csv")

train_images = train.iloc[:, 1:].values
train_labels = train.iloc[:, 0].values

test_images = test.iloc[:, 1:].values
test_labels = test.iloc[:, 0].values

train_images = train_images.reshape(len(train_images), IMG_WIDTH, IMG_HEIGHT)
test_images = test_images.reshape(len(test_images), IMG_WIDTH, IMG_HEIGHT)

print("There are {} images in the training set".format(np.shape(train_images)[0]))
print("Image shape: {}".format(np.shape(train_images)[1:]))

print("There are {} images in the test set".format(np.shape(test_images)[0]))
print("Image shape: {}".format(np.shape(test_images)[1:]))

classes = np.array(train.iloc[:, 0].values)
unique, counts = np.unique(classes, return_counts=True)

fig, ax = plt.subplots()
ax.bar(unique, counts)
ax.set_xticks(np.arange(len(CATEGORIES)))
ax.set_xticklabels(CATEGORIES)
plt.show()

plt.figure(figsize=(14, 12))

for i in range(0,25):
    splt = plt.subplot(5, 5, i+1)
    plt.imshow(train.iloc[:, 1:].values[i].reshape(28, 28), cmap="gray")
    plt.title("{}".format(CATEGORIES[train.iloc[:, 0].values[i]]))
    plt.xticks([])
    plt.yticks([])

plt.tight_layout()
plt.show()

# ----------------------  CONVERTIR TOTES LES IMATGES A RANGS DE 0 A 1  -----------------------------

train_images = train_images / 255.0
test_images = test_images / 255.0

plt.figure(figsize=(10,10))
for i in range(25):
    plt.subplot(5,5,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(train_images[i])
    plt.xlabel(CATEGORIES[train_labels[i]])
plt.show()

# ------------------------------ CREACIO DEL MODEL ---------------------------------------

model = keras.Sequential([
    keras.layers.Flatten(input_shape=(28, 28)),
    keras.layers.Dense(128, activation='relu'),
    keras.layers.Dense(128, activation='relu'),
    keras.layers.Dense(64, activation='relu'),
    keras.layers.Dense(len(CATEGORIES))
])

model.compile(optimizer='adam',
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])

model.fit(train_images, train_labels, epochs=15)

test_loss, test_acc = model.evaluate(test_images,  test_labels, verbose=2)

print('\nTest accuracy:', test_acc)



img = test_images[3]
img2 = (np.expand_dims(img,0))

predictions_single = model.predict(img2)

index = np.argmax(predictions_single[0])

print(CATEGORIES[index])

plt.figure()
plt.imshow(img)
plt.show()

model_json = model.to_json()
with open("model/model.json", "w") as json_file:
    json_file.write(model_json)
model.save_weights("model/model.h5")
