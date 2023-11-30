part of '../screen_shot.dart';

class _ClipPathScreenShotPartScreen extends CustomClipper<Path> {
  const _ClipPathScreenShotPartScreen({required this.points});
  final List<Offset> points;

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (points.isNotEmpty) {
      path.addRect(Rect.fromPoints(points.first, points.last));
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
