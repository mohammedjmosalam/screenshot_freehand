part of '../screen_shot.dart';

class _SelectScreenShotType extends StatelessWidget {
  const _SelectScreenShotType({
    super.key,
    this.freeHandScreenIcon,
    this.fullScreenIcon,
    this.partScreenIcon,
  });
  final Icon? fullScreenIcon;
  final Icon? partScreenIcon;
  final Icon? freeHandScreenIcon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff333333),
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AppIconWidget(
              onTap: () =>
                  context.read<ScreenShotController>().takeFullScreenShot(),
              iconData: Icons.fullscreen,
              icon: fullScreenIcon,
            ),
            _AppIconWidget(
              onTap: () => context
                  .read<ScreenShotController>()
                  .selectedTypeScreenShot(ScreenShotType.freeHand),
              iconData: Icons.draw,
              icon: freeHandScreenIcon,
            ),
            _AppIconWidget(
              onTap: () => context
                  .read<ScreenShotController>()
                  .selectedTypeScreenShot(ScreenShotType.part),
              iconData: Ionicons.scan,
              icon: partScreenIcon,
            ),
            _AppIconWidget(
              onTap: () =>
                  context.read<ScreenShotController>().cancelScreenShot(),
              iconData: Ionicons.close,
            ),
          ],
        ),
      ),
    );
  }
}
