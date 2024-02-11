part of '../screen_shot.dart';

class _ScreenShotBody extends StatelessWidget {
  const _ScreenShotBody({
    super.key,
    this.freeHandScreenIcon,
    this.fullScreenIcon,
    this.partScreenIcon,
    this.allBoxTheme,
    this.cancelScreenShotIcon,
    this.cancelTheme,
    this.freeHandScreenTheme,
    this.fullScreenTheme,
    this.partScreenTheme,
    this.screenTheme,
    required this.screenShotPositionAlign,
  });
  final Icon? fullScreenIcon;
  final Icon? partScreenIcon;
  final Icon? freeHandScreenIcon;
  final Icon? cancelScreenShotIcon;
  final ScreenTheme? screenTheme;
  final BoxTheme? allBoxTheme;
  final BoxTheme? fullScreenTheme;
  final BoxTheme? partScreenTheme;
  final BoxTheme? freeHandScreenTheme;
  final BoxTheme? cancelTheme;
  final Alignment screenShotPositionAlign;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenShotController, ScreenShotControllerState>(
      buildWhen: (pervious, current) =>
          pervious.isEnableScreenShot != current.isEnableScreenShot ||
          pervious.showScreenShotType != current.showScreenShotType ||
          pervious.screenShotType != current.screenShotType,
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              color: state.isEnableScreenShot || state.showScreenShotType
                  ? screenTheme?.barrierColor ?? Colors.white.withOpacity(0.4)
                  : null,
            ),
            RepaintBoundary(
              key: state.globalKeyRepaint,
              child: state.isEnableScreenShot
                  ? const _ScreenShotDraw()
                  : SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                    ),
            ),
            if (state.showScreenShotType)
              _SelectScreenShotType(
                freeHandScreenIcon: freeHandScreenIcon,
                fullScreenIcon: fullScreenIcon,
                partScreenIcon: partScreenIcon,
                allBoxTheme: allBoxTheme,
                cancelScreenShotIcon: cancelScreenShotIcon,
                cancelTheme: cancelTheme,
                freeHandScreenTheme: freeHandScreenTheme,
                fullScreenTheme: fullScreenTheme,
                partScreenTheme: partScreenTheme,
                screenTheme: screenTheme,
                screenShotPositionAlign: screenShotPositionAlign,
              ),
          ],
        );
      },
    );
  }
}
