part of '../screen_shot.dart';

class _ClipPathScreenShotFreeHand extends CustomClipper<Path> {
  const _ClipPathScreenShotFreeHand({required this.points});
  final List<Offset> points;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon(points, true);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
