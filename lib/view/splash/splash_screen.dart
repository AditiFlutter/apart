import 'package:apart/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../constant/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  SplashController? splashController;

  _SplashScreenState() : super(SplashController()) {
    splashController = controller as SplashController?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: splashController!.scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            decoration:const BoxDecoration(
              gradient:LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [colorTheme,colorWhite,colorLeafGreen]
              )
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/png/logo1.png",
                height: 220,
              )),
          const Align(
            alignment:Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child:Text("Powered by SYSTEQIndia",style:TextStyle(fontSize:16,color:colorThemeGreen,fontWeight:FontWeight.w600,fontStyle:FontStyle.normal),)),
          )

        ],
      ),
    );
  }
}
