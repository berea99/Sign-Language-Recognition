import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;
import 'dart:math' as math;

typedef void Callback(List<dynamic> list, int h, int w);

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Callback setRecognitions;

  Camera(this.cameras, this.setRecognitions);

  @override
  _CameraState createState() => new _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();

    Uint8List grayscaleToByteListFloat32(img.Image image, int inputSize) {
      var convertedBytes = Float32List(3 * inputSize * inputSize);
      var buffer = Float32List.view(convertedBytes.buffer);
      int pixelIndex = 0;
      for (var i = 0; i < inputSize; i++) {
        for (var j = 0; j < inputSize; j++) {
          var pixel = image.getPixel(j, i);
          buffer[pixelIndex++] = (img.getRed(pixel) / 255);
          buffer[pixelIndex++] = (img.getGreen(pixel) / 255);
          buffer[pixelIndex++] = (img.getBlue(pixel) / 255);
        }
      }
      return convertedBytes.buffer.asUint8List();
    }

    img.Image _convertBGRA8888(CameraImage image) {
      return img.Image.fromBytes(
        image.width,
        image.height,
        image.planes[0].bytes,
        format: img.Format.bgra,
      );
    }

    if (widget.cameras == null || widget.cameras.length < 1) {
      print('No camera is found');
    } else {
      controller = new CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
      );
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});

        controller.startImageStream((CameraImage cameraimg) {
          if (!isDetecting) {
            isDetecting = true;

            int startTime = new DateTime.now().millisecondsSinceEpoch;

            img.Image imageToPredict = _convertBGRA8888(cameraimg);
            imageToPredict = img.copyResize(imageToPredict,
                width: 200,
                height: 200,
                interpolation: img.Interpolation.average);
            Tflite.runModelOnBinary(
              binary: grayscaleToByteListFloat32(imageToPredict, 200),
              numResults: 2,
              threshold: 0.5,
              asynch: false,
            ).then((recognitions) {
              int endTime = new DateTime.now().millisecondsSinceEpoch;
              print("Detection took ${endTime - startTime}");
              print("$recognitions");

              widget.setRecognitions(
                  recognitions ?? [], cameraimg.height, cameraimg.width);

              isDetecting = false;
            });
          }
        });
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }

    var tmp = MediaQuery.of(context).size;
    var screenH = math.max(tmp.height, tmp.width);
    var screenW = math.min(tmp.height, tmp.width);
    tmp = controller.value.previewSize ?? MediaQuery.of(context).size;
    var previewH = math.max(tmp.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    var screenRatio = screenH / screenW;
    var previewRatio = previewH / previewW;

    return OverflowBox(
      maxHeight:
          screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
      maxWidth:
          screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
      child: CameraPreview(controller),
    );
  }
}
