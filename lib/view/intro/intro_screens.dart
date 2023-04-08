import 'package:apart/Constant/app_colors.dart';
import 'package:apart/utils/extensions/goto.dart';
import 'package:apart/view/intro/controller/intro_controller.dart';
import 'package:apart/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../constant/route_constants.dart';
import '../../widgets/rectangle_theme_button.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends StateMVC<IntroScreen> with TickerProviderStateMixin{
  IntroController? introController;
  TabController? tabController;
  PageController smoothPageController = PageController(keepPage: true, initialPage: 0);

  _IntroScreenState() : super(IntroController()) {
    introController = controller as IntroController?;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController!.addListener(() {
      setState(() {
        smoothPageController = PageController(
            keepPage: true, initialPage: tabController!.index
        );
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      PageController smoothPageController = PageController(keepPage: true, initialPage: 0);
    });
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset:false,
        backgroundColor:Colors.transparent,
        body: Stack(
          children: [
            TabBarView(
              controller: tabController,
              children: [
                Stack(
                  fit:StackFit.expand,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration:  const BoxDecoration(
                          gradient:LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [colorTheme,colorWhite,colorLeafGreen]
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setSp(28)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenUtil().setSp(50),
                            ),
                            Image.asset("assets/png/Apartment rent-bro.png"),
                            SizedBox(
                              height: ScreenUtil().setSp(10),
                            ),
                            Text.rich(
                                textAlign:TextAlign.center,
                                TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                          "Lorem Ipsum is simply dummy text \n\n",
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                              ScreenUtil().setSp(21),
                                              color: colorBlue,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w700)
                                      ),
                                      TextSpan(
                                          text:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since",
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                              ScreenUtil().setSp(14),
                                              color: colorDarkGrey,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w400)
                                      ),
                                    ])),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment:Alignment.bottomCenter,
                      child:  RectangleThemeButton(text:"Next",onTap:(){
                        tabController!.animateTo(1);
                      },),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          context.pushReplacement(const Login());
                        },
                        child: Container(
                          margin: EdgeInsets.only(right:ScreenUtil().setSp(5),top: ScreenUtil().setSp(14)),
                          width: ScreenUtil().setSp(68),
                          height: ScreenUtil().setSp(68),
                          child: Center(child: Text("Skip",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color:colorWhite),)),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit:StackFit.expand,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration:  const BoxDecoration(
                          gradient:LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [colorTheme,colorWhite,colorLeafGreen]
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setSp(28)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenUtil().setSp(60),
                            ),
                            Image.asset("assets/png/intro3.png"),
                            SizedBox(
                              height: ScreenUtil().setSp(50),
                            ),
                            Text.rich(
                                textAlign:TextAlign.center,
                                TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                          "Lorem Ipsum is simply dummy text \n\n",
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                              ScreenUtil().setSp(21),
                                              color: colorBlue,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w700)
                                      ),
                                      TextSpan(
                                          text:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since",
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                              ScreenUtil().setSp(14),
                                              color: colorDarkGrey,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w400)
                                      ),
                                    ])),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment:Alignment.bottomCenter,
                      child:  RectangleThemeButton(text:"Next",onTap:(){
                        tabController!.animateTo(2);
                      },),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          context.pushReplacement(const Login());
                        },
                        child: Container(
                          margin: EdgeInsets.only(right:ScreenUtil().setSp(5),top: ScreenUtil().setSp(14)),
                          width: ScreenUtil().setSp(68),
                          height: ScreenUtil().setSp(68),
                          child: Center(child: Text("Skip",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color:colorWhite),)),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit:StackFit.expand,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration:  const BoxDecoration(
                          gradient:LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [colorTheme,colorWhite,colorLeafGreen]
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setSp(28)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenUtil().setSp(50),
                            ),
                            Image.asset("assets/png/img1.png"),
                            SizedBox(
                              height: ScreenUtil().setSp(10),
                            ),
                            Text.rich(
                                textAlign:TextAlign.center,
                                TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                          "Lorem Ipsum is simply dummy text \n\n",
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                              ScreenUtil().setSp(21),
                                              color: colorBlue,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w700)
                                      ),
                                      TextSpan(
                                          text:
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since",
                                          style: GoogleFonts.poppins(
                                              fontSize:
                                              ScreenUtil().setSp(14),
                                              color: colorDarkGrey,letterSpacing:0.3,height:1.6,fontWeight:FontWeight.w400)
                                      ),
                                    ])),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment:Alignment.bottomCenter,
                      child:  RectangleThemeButton(text:"Let's Go",onTap:(){
                        context.pushReplacement(const Login());
                      },),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setSp(140) ),
                child: SmoothPageIndicator(
                  controller: smoothPageController,
                  count:3,
                  axisDirection: Axis.horizontal,
                  effect:  const SlideEffect(
                      spacing: 5.0,
                      radius: 4.0,
                      dotWidth: 12.0,
                      dotHeight: 5.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor:colorTheme,
                      activeDotColor: colorTheme),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
