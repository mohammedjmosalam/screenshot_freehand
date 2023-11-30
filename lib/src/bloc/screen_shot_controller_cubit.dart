import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart';
import 'package:screenshot_freehand/src/helper/screen_shot_type.dart';
part 'screen_shot_controller_state.dart';

class ScreenShotController extends Cubit<ScreenShotControllerState> {
  StreamController<Uint8List?> _streamController =
      StreamController<Uint8List?>();
  List<Offset> points = [];
  ScreenShotController()
      : super(
          ScreenShotControllerState(
            globalKeyRepaintFullScreen: GlobalKey(),
            globalKeyRepaint: GlobalKey(),
            points: StreamController<List<Offset>>.broadcast(),
          ),
        );
  void startDraw(DragStartDetails details) {
    final point = details.globalPosition;
    points.add(point);
    state.points.add(points);
  }

  Future<void> takeFullScreenShot() async {
    _streamController.add(state.imageData);
    points = [];
    state.points.add(points);
    emit(state.copyWith(
      isEnableScreenShot: false,
      showScreenShotType: false,
    ));
    await _streamController.close();
  }

  Future<Uint8List?> _takeFullScreenShot() async {
    return await captureImage(state.globalKeyRepaintFullScreen);
  }

  Future<Uint8List?> takeSnapShot() async {
    _streamController = StreamController<Uint8List?>();
    Uint8List? imageData = await _takeFullScreenShot();
    if (imageData != null) {
      points = [];
      state.points.add(points);
      emit(state.copyWith(
        imageData: imageData,
        showScreenShotType: true,
      ));
      return await _streamController.stream.last;
    }
    return null;
  }

  Future<void> cancelScreenShot() async {
    emit(state.copyWith(
      isEnableScreenShot: false,
      showScreenShotType: false,
    ));
    _streamController.add(null);
    await _streamController.close();
  }

  Future<void> selectedTypeScreenShot(ScreenShotType screenShotType) async {
    emit(state.copyWith(
      isEnableScreenShot: true,
      showScreenShotType: false,
      screenShotType: screenShotType,
    ));
  }

  void updateDraw(DragUpdateDetails details) {
    final point = details.globalPosition;
    points.add(point);
    state.points.add(points);
  }

  Future<void> endDraw(DragEndDetails details) async {
    var image = await captureImage(state.globalKeyRepaint);
    if (image != null) {
      image = await getCroppedImageData(image);
    }

    _streamController.add(image);
    points = [];
    state.points.add(points);
    emit(state.copyWith(
      isEnableScreenShot: false,
    ));
    await _streamController.close();
  }

  Future<Uint8List?> captureImage(GlobalKey keyPaint) async {
    try {
      final renderObject = keyPaint.currentContext!.findRenderObject();
      final boundary = renderObject as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 1);

      // Convert image to bytes in PNG format and return
      final byteData = await image.toByteData(
        format: ImageByteFormat.png,
      );
      final pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      return null;
    }
  }

  Future<Uint8List?> getCroppedImageData(Uint8List imageData) async {
    try {
      final decodedImage = decodeImage(imageData);
      points.sort((a, b) => a.dx.compareTo(b.dx));
      double dx = points.first.dx;
      double endDx = points.last.dx;
      points.sort((a, b) => a.dy.compareTo(b.dy));
      double dy = points.first.dy;
      double endDy = points.last.dy;

      final imageCropped = copyCrop(
        decodedImage!,
        x: dx.floor(),
        y: dy.floor(),
        width: (endDx - dx).abs().ceil(),
        height: (endDy - dy).abs().ceil(),
      );

      return Uint8List.fromList(encodePng(imageCropped));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
