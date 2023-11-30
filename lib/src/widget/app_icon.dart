part of '../screen_shot.dart';

class _AppIconWidget extends StatelessWidget {
  const _AppIconWidget({
    super.key,
    required this.iconData,
    required this.onTap,
    this.icon,
  });
  final IconData iconData;
  final Function() onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xff262626),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              spreadRadius: -5,
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
              offset: Offset(0, 5),
              color: Colors.black,
            )
          ],
        ),
        child: icon ??
            Icon(
              iconData,
              color: Colors.white,
              size: 25,
            ),
      ),
    );
  }
}
