import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sl_app/core/ui-components/theme/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sl_app/routes/router.gr.dart';

import 'core/ui-components/theme/sized_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: primaryColor),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int currentPage = 0;
  bool showTextField = true;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Sign Language App",
      "image": "assets/images/sl_image.png"
    },
    {
      "text":
          "You can select a image from your gallery for know which sign is being representied",
      "image": "assets/images/galeria.PNG"
    },
    {
      "text":
          "You can also record the signs that you or someone else are doing to know the signs in real time",
      "image": "assets/images/video.jpg"
    },
  ];
  TextEditingController _nameController = new TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Text(
                  "Sign Language App",
                  style: GoogleFonts.montserrat(
                    fontSize: getProportionateScreenWidth(context, 34),
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      splashData[index]["image"] ?? '',
                      splashData[index]['text'] ?? '',
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(context, 20)),
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => buildDot(index),
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    )),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(SectionsRoute()),
        tooltip: 'Continue',
        child: Icon(Icons.arrow_forward),
        backgroundColor: primaryColor,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? primaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent(this.image, this.text, {Key? key}) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(flex: 1),
        Image.asset(
          image,
          height: getProportionateScreenHeight(context, 265),
          width: getProportionateScreenWidth(context, 235),
        ),
        Spacer(flex: 1),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
