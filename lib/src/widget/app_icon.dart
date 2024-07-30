part of '../screen_shot.dart';

class _AppIconWidget extends StatelessWidget {
  const _AppIconWidget({
    super.key,
    required this.iconData,
    required this.onTap,
    this.icon,
    this.boxTheme,
    this.customWidget,
    this.paddingIcons,
  });
  final IconData iconData;
  final Function() onTap;
  final Icon? icon;
  final BoxTheme? boxTheme;
  final Widget? customWidget;
  final EdgeInsets? paddingIcons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: customWidget ??
          Container(
            width: boxTheme?.widthBoxIcon ?? 30,
            height: boxTheme?.heightBoxIcon ?? 30,
            margin: paddingIcons,
            decoration: boxTheme?.boxTheme ??
                BoxDecoration(
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
