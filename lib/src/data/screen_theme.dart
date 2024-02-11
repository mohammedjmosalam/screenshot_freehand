import 'package:flutter/material.dart';

class ScreenTheme {
  final BoxDecoration? screenShotTheme;
  final double? widthBoxScreenShotTool;
  final double? heightBoxScreenShotTool;
  final Color? barrierColor;
  final EdgeInsetsGeometry? paddingBoxScreenShot;
  final EdgeInsetsGeometry? paddingBoxesInScreenShot;
  ScreenTheme({
    this.barrierColor,
    this.heightBoxScreenShotTool,
    this.screenShotTheme,
    this.widthBoxScreenShotTool,
    this.paddingBoxScreenShot,
    this.paddingBoxesInScreenShot,
  });
}
