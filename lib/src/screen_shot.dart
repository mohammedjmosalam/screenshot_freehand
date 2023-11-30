import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:screenshot_freehand/screenshot_freehand.dart';
part 'widget/screen_shot_body.dart';
part 'widget/part_screen_shot.dart';
part 'widget/select_screen_shot_type.dart';
part 'widget/app_icon.dart';
part 'helper/clip_path_part.dart';
part 'helper/clip_path_free_hand.dart';

class ScreenShot extends StatelessWidget {
  const ScreenShot({
    super.key,
    required this.child,
    required this.screenShotController,
    this.freeHandScreenIcon,
    this.fullScreenIcon,
    this.partScreenIcon,
  });
  final Widget child;
  final ScreenShotController screenShotController;
  final Icon? fullScreenIcon;
  final Icon? partScreenIcon;
  final Icon? freeHandScreenIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ScreenShotController>(
        create: (contextB) => screenShotController,
        child: RepaintBoundary(
          key: screenShotController.state.globalKeyRepaintFullScreen,
          child: Stack(
            children: [
              child,
              _ScreenShotBody(
                freeHandScreenIcon: freeHandScreenIcon,
                fullScreenIcon: fullScreenIcon,
                partScreenIcon: partScreenIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
