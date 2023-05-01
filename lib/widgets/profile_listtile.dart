import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.onTap,
    required this.text,
    required this.img,
  }) : super(key: key);

  final Function()? onTap;
  final String text,img;


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Padding(
          padding: const EdgeInsets.only(bottom:18,top:18),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Expanded(
                flex:1,
                child: SvgPicture.asset(img,height:20,
                ),
              ),
              const SizedBox(width:15,),
              Expanded(
                flex:12,
                child: Text(text,textScaleFactor: 1,
                    style: TextStyle(color:colorg, fontSize:14, fontWeight: FontWeight.w500,)),
              ),
              Expanded(
                flex:1,
                child: SvgPicture.asset(
                  "assets/svg/dropDown.svg",height:8,
                ),
              ),
            ],
          )
      ),
    );
  }
}