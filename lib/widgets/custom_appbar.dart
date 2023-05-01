import 'package:apart/Constant/app_colors.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? title;
  final Widget? leading;
  final double height;
  final double? elevation;
  final Color? backgroundColor, titleColor, statusBarColor;
  final Brightness? statusBarIconBrightness;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const MyAppBar({
    super.key,
    this.titleName,
    this.title,
    this.leading,
    this.height = kToolbarHeight,
    this.elevation = 0.0,
    this.backgroundColor = Colors.white,
    this.titleColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.centerTitle = false,
    this.actions,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      centerTitle: centerTitle,
      automaticallyImplyLeading:false,
      bottom: bottom,
      leading: leading ??
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: colorTheme,
              size: 22,
            ),
            onPressed: () {
              context.pop();
            },
          ),
      title: Text(
        title ?? "",
        style: const TextStyle(
            color:colorTheme,
            fontSize: 16,
            letterSpacing: 1,overflow:TextOverflow.visible,
            fontWeight: FontWeight.w900,
        ),
      ),
      actions: actions,
    );
  }
}
