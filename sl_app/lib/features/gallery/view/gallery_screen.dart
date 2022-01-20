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
    var appBar = AppBar(
      toolbarHeight: 100,
      title: Text('Sign Language App'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: appBar.preferredSize,
        child: Theme(data: themeDataDark, child: appBar),
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: primaryColor),
        Column(
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
            Expanded(
              child: Container(
                color: primaryColor,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 0.1 * MediaQuery.of(context).size.height),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: Image.file(
                                                      image,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  height: 250,
                                                  width: 250,
                                                  color: Colors.white,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/images/picture.png',
                                                      height: 100,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: complementary5,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                  ),
                                                ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Divider(
                                            height: 20,
                                            thickness: 1,
                                            color: primaryColor,
                                          ),
                                          Text(
                                              'The sign corresponds to the letter:',
                                              style: appTextTheme.subtitle1),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          result != null
                                              ? Text('${result[0]['label']}',
                                                  style: appTextTheme.headline1)
                                              : Container(),
                                          Divider(
                                            height: 20,
                                            thickness: 1,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      82,
                                                  child: ElevatedButton(
                                                      onPressed: () => context
                                                          .read<GalleryCubit>()
                                                          .pickImage(),
                                                      child: Text(
                                                        'Camera'.toUpperCase(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: complementary,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      82,
                                                  child: ElevatedButton(
                                                    onPressed: () => context
                                                        .read<GalleryCubit>()
                                                        .pickGalleryImage(),
                                                    child: Text(
                                                      'Gallery'.toUpperCase(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                complementary2),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
