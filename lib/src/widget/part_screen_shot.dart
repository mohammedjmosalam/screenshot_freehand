part of '../screen_shot.dart';

class _ScreenShotDraw extends StatelessWidget {
  const _ScreenShotDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenShotController, ScreenShotControllerState>(
      buildWhen: (pervious, current) =>
          pervious.points != current.points ||
          pervious.imageData != current.imageData,
      builder: (context, state) {
        return StreamBuilder<List<Offset>>(
          stream: state.points.stream,
          builder: (context, snapShot) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: context.read<ScreenShotController>().startDraw,
              onPanEnd: context.read<ScreenShotController>().endDraw,
              onPanUpdate: context.read<ScreenShotController>().updateDraw,
              child: RepaintBoundary(
                child: ClipPath(
                  clipper: state.screenShotType == ScreenShotType.part
                      ? _ClipPathScreenShotPartScreen(
                          points: snapShot.data ?? [],
                        )
                      : _ClipPathScreenShotFreeHand(
                          points: snapShot.data ?? [],
                        ),
                  child: Stack(
                    children: [
                      if (state.imageData != null)
                        Image.memory(
                          state.imageData!,
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
