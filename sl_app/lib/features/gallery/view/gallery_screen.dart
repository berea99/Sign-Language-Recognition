import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sl_app/core/ui-components/theme/colors.dart';
import 'package:sl_app/features/gallery/logic/gallery_cubit.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreenWithCubit extends StatelessWidget {
  const GalleryScreenWithCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GalleryCubit()..initialize(),
      child: const GalleryScreen(),
    );
  }
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GalleryCubit>().loadModel();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language App'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return state.when(
              initial: () => loadedUI(false),
              loading: () => loadedUI(true),
              loadingPrediction: (image) => loadedUI(true, image: image),
              predictionLoaded: (image, list) =>
                  loadedUI(false, image: image, result: list),
              error: (error, code) => loadedUI(false));
        },
      ),
    );
  }

  Widget loadedUI(bool loading, {File? image, List? result}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 80),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Container(
                        child: Column(
                          children: [
                            image != null
                                ? Container(
                                    height: 250,
                                    width: 250,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.file(
                                        image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 250,
                                    width: 250,
                                    color: primaryColor,
                                    child: Container(
                                      child: Icon(
                                        Icons.image,
                                        color: primaryColor,
                                        size: 80,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 30,
                            ),
                            Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.white,
                            ),
                            Text(
                              'El signo corresponde a la letra:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            result != null
                                ? Text(
                                    '${result[0]['label']}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )
                                : Container(),
                            Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            82,
                                    child: ElevatedButton(
                                      onPressed: () => context
                                          .read<GalleryCubit>()
                                          .pickImage(),
                                      child: Text(
                                        'Camara'.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: primaryColor),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            82,
                                    child: ElevatedButton(
                                      onPressed: () => context
                                          .read<GalleryCubit>()
                                          .pickGalleryImage(),
                                      child: Text(
                                        'Galería'.toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: primaryColor),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
