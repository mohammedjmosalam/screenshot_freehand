part of 'screen_shot_controller_cubit.dart';

class ScreenShotControllerState extends Equatable {
  const ScreenShotControllerState({
    this.screenShotType = ScreenShotType.part,
    this.isEnableScreenShot = false,
    required this.points,
    required this.globalKeyRepaint,
    required this.globalKeyRepaintFullScreen,
    this.imageData,
    this.showScreenShotType = false,
  });
  final ScreenShotType screenShotType;
  final bool isEnableScreenShot;
  final StreamController<List<Offset>> points;
  final GlobalKey globalKeyRepaint;
  final GlobalKey globalKeyRepaintFullScreen;
  final Uint8List? imageData;
  final bool showScreenShotType;
  ScreenShotControllerState copyWith({
    ScreenShotType? screenShotType,
    bool? showScreenShotType,
    bool? isEnableScreenShot,
    GlobalKey? globalKeyRepaint,
    Uint8List? imageData,
  }) =>
      ScreenShotControllerState(
        globalKeyRepaintFullScreen: globalKeyRepaintFullScreen,
        screenShotType: screenShotType ?? this.screenShotType,
        isEnableScreenShot: isEnableScreenShot ?? this.isEnableScreenShot,
        points: points,
        globalKeyRepaint: globalKeyRepaint ?? this.globalKeyRepaint,
        imageData: imageData ?? this.imageData,
        showScreenShotType: showScreenShotType ?? this.showScreenShotType,
      );

  @override
  List<Object?> get props => [
        screenShotType,
        isEnableScreenShot,
        points,
        globalKeyRepaint,
        imageData,
        globalKeyRepaintFullScreen,
        showScreenShotType,
      ];
}
