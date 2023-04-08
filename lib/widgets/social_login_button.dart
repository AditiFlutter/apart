import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Function()? onTap;
  final String text;
  final String icon;


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
      width: double.infinity,
      child:Container(
        decoration:BoxDecoration(
          color:colorWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft:
            Radius.circular(15),
            bottomRight:
            Radius.circular(15),
          ),
          border:Border.all(color:colorTheme)

        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Container(
                color:colorWhite,
                child: Image.asset(icon),
              ),
              SizedBox(width:10,),
              Container(
                color:colorWhite,
                child: Text(text,
                    style: GoogleFonts.poppins(
                        fontSize:
                        ScreenUtil().setSp(18),
                        color: colorTextGrey,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      )
    );
  }
}