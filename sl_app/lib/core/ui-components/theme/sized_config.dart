import 'package:flutter/material.dart';

double getProportionateScreenHeight(BuildContext context, double inputHeight) {
  double screenHeight = MediaQuery.of(context).size.height;

  return (inputHeight / 812.0) * screenHeight;
}

double getProportionateScreenWidth(BuildContext context, double inputWidth) {
  double screenWidth = MediaQuery.of(context).size.width;

  return (inputWidth / 375.0) * screenWidth;
}
