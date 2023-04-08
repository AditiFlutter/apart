import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';

class RectangleThemeButton extends StatelessWidget {
  const RectangleThemeButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function()? onTap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setWidth(10),
        left: ScreenUtil().setSp(17),
        right: ScreenUtil().setSp(17),
        bottom: ScreenUtil().setWidth(10),
      ),
      height: ScreenUtil().setHeight(50),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(
                colorTheme),
            shape: MaterialStateProperty.all<
                RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft:
                      Radius.circular(15),
                      bottomRight:
                      Radius.circular(15),
                    ),
                    side: BorderSide(
                        color: colorTheme)))),
        child: Center(
          child: Text(text,
              style: GoogleFonts.poppins(
                  fontSize:
                  ScreenUtil().setSp(18),
                  color: colorWhite,
                  fontWeight: FontWeight.w600)),
        ),
        onPressed:onTap,
      ),
    );
  }
}