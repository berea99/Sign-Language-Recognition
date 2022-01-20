import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sl_app/core/ui-components/theme/colors.dart';
import 'package:sl_app/core/ui-components/theme/sized_config.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sl_app/routes/router.gr.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  _SectionsScreenState createState() => _SectionsScreenState();
}

class _SectionsScreenState extends State<SectionsScreen> {
  bool pressBotton1 = false;
  bool pressBotton2 = false;
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
      body: Stack(
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
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 0.1 * MediaQuery.of(context).size.height),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Options:',
                                style: appTextTheme.headline1,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/hand3d.png',
                                          height: 100,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          'Real Time',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
                                        Size(
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                16,
                                            getProportionateScreenHeight(
                                                context, 265)),
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              complementary),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              side: BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () async {
                                    var cameras = await loadCameras();

                                    await electionDialog();
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/camera.png',
                                          height: 100,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          'Gallery',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
                                        Size(
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                16,
                                            getProportionateScreenHeight(
                                                context, 265)),
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              complementary2),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              side: BorderSide(
                                                  color: Colors.white)))),
                                  onPressed: () async {
                                    context.router
                                        .push(GalleryRouteWithCubit());
                                  },
                                ),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 6,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<CameraDescription>> loadCameras() async {
    var cameras = await availableCameras();
    return cameras;
  }

  Future electionDialog() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.of(context).pop(false);
              return false;
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Real Time Options:',
                        style: appTextTheme.subtitle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/hand3d2.png',
                                      height: 100,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Text'.toUpperCase(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(Size(
                                      MediaQuery.of(context).size.width / 3,
                                      getProportionateScreenHeight(
                                          context, 265))),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          complementary3),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          side: BorderSide(color: Colors.white)))),
                              onPressed: () async {
                                var cameras = await loadCameras();

                                context.router
                                    .push(LiveRoute(cameras: cameras));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Text'.toUpperCase(),
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.25,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/images/hand3d2.png',
                                      height: 100,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all<Size>(Size(
                                      MediaQuery.of(context).size.width / 3,
                                      getProportionateScreenHeight(
                                          context, 265))),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          complementary4),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          side: BorderSide(color: Colors.white)))),
                              onPressed: () async {
                                context.router.push(WordToSlRouteWithCubit());
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
