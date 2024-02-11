part of '../screen_shot.dart';

class _SelectScreenShotType extends StatelessWidget {
  const _SelectScreenShotType({
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
    return Align(
      alignment: screenShotPositionAlign,
      child: Container(
        width: screenTheme?.widthBoxScreenShotTool,
        height: screenTheme?.heightBoxScreenShotTool,
        decoration: screenTheme?.screenShotTheme ??
            BoxDecoration(
              color: Color(0xff333333),
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
        margin: screenTheme?.paddingBoxScreenShot ?? const EdgeInsets.all(8),
        padding:
            screenTheme?.paddingBoxesInScreenShot ?? const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AppIconWidget(
              onTap: () =>
                  context.read<ScreenShotController>().takeFullScreenShot(),
              iconData: Icons.fullscreen,
              boxTheme: fullScreenTheme,
              icon: fullScreenIcon,
            ),
            _AppIconWidget(
              onTap: () => context
                  .read<ScreenShotController>()
                  .selectedTypeScreenShot(ScreenShotType.freeHand),
              iconData: Icons.draw,
              boxTheme: freeHandScreenTheme,
              icon: freeHandScreenIcon,
            ),
            _AppIconWidget(
              onTap: () => context
                  .read<ScreenShotController>()
                  .selectedTypeScreenShot(ScreenShotType.part),
              iconData: Ionicons.scan,
              boxTheme: partScreenTheme,
              icon: partScreenIcon,
            ),
            _AppIconWidget(
              onTap: () =>
                  context.read<ScreenShotController>().cancelScreenShot(),
              iconData: Ionicons.close,
              boxTheme: cancelTheme,
              icon: cancelScreenShotIcon,
            ),
          ],
        ),
      ),
    );
  }
}
