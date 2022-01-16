import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language App'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Real Time',
                    style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () async {
                        var cameras = await loadCameras();

                        await electionDialog();
                      },
                      child: Icon(
                        Icons.camera,
                        color: primaryColor,
                        size: 80,
                      ),
                      style: OutlinedButton.styleFrom(
                          elevation: pressBotton1 ? 0 : 10,
                          backgroundColor: Colors.white,
                          shadowColor: primaryColor,
                          side: BorderSide(color: primaryColor, width: 2),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 - 16,
                              getProportionateScreenHeight(context, 265))),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Foto de la Galería',
                    style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          pressBotton2 = !pressBotton2;
                          context.router.push(GalleryRouteWithCubit());
                          pressBotton2 = !pressBotton2;
                        });
                      },
                      child: Icon(
                        Icons.photo_library,
                        color: primaryColor,
                        size: 80,
                      ),
                      style: OutlinedButton.styleFrom(
                          elevation: pressBotton2 ? 0 : 10,
                          backgroundColor: Colors.white,
                          shadowColor: primaryColor,
                          side: BorderSide(color: primaryColor, width: 2),
                          fixedSize: Size(
                              MediaQuery.of(context).size.width / 2 - 16,
                              getProportionateScreenHeight(context, 265))),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            'Seleccione una de las dos opciones',
            style: TextStyle(fontSize: 20, color: primaryColor),
          ),
          Spacer(
            flex: 3,
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
                      Text('Escoge una Opción:'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () async {
                                var cameras = await loadCameras();
                                setState(() {
                                  context.router
                                      .push(LiveRoute(cameras: cameras));
                                });
                              },
                              child: Text(
                                'Sign Language To Text',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                  elevation: pressBotton1 ? 0 : 10,
                                  backgroundColor: Colors.white,
                                  shadowColor: primaryColor,
                                  side:
                                      BorderSide(color: primaryColor, width: 2),
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width / 3,
                                      getProportionateScreenHeight(
                                          context, 265))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  context.router.push(WordToSlRouteWithCubit());
                                });
                              },
                              child: Text(
                                'Text To Sign Language',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: OutlinedButton.styleFrom(
                                  elevation: pressBotton2 ? 0 : 10,
                                  backgroundColor: Colors.white,
                                  shadowColor: primaryColor,
                                  side:
                                      BorderSide(color: primaryColor, width: 2),
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width / 3,
                                      getProportionateScreenHeight(
                                          context, 265))),
                            ),
                          ),
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
