import 'package:apart/Constant/app_colors.dart';
import 'package:apart/utils/hive_utils.dart';
import 'package:apart/view/manpower/ViewModel/manpower_cat_vm.dart';
import 'package:apart/view/manpower/manpower_shift_data.dart';
import 'package:apart/view/splash/splash_screen.dart';
import 'package:apart/view_model/bootom_vm.dart';
import 'package:apart/view_model/calendra_vm.dart';
import 'package:apart/view_model/categories_vm.dart';
import 'package:apart/view_model/home_vm.dart';
import 'package:apart/view_model/login_vm.dart';
import 'package:apart/view_model/manpower_shift_data_vm.dart';
import 'package:apart/view_model/manpower_workers_data_vm.dart';
import 'package:apart/view_model/otp_vm.dart';

import 'package:apart/view_model/profile_vm.dart';
import 'package:apart/view_model/signup_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveUtils.init();
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => LoginVM()),
        ChangeNotifierProvider(create: (context) => CalendarVM()),
        ChangeNotifierProvider(create: (context) => BottomBarVM()),
        ChangeNotifierProvider(create: (context) => SignupVM()),
        ChangeNotifierProvider(create: (context) => ProfileVM()),
        ChangeNotifierProvider(create: (context) => HomeVM()),
        ChangeNotifierProvider(create: (context) => ManpowerCatVm()),
        ChangeNotifierProvider(create: (context) => CateogoriesVM()),
        ChangeNotifierProvider(create: (context) => ManpowerShiftDataVM()),
        ChangeNotifierProvider(create: (context) => ManpowerWorkersDataVM()),
        ChangeNotifierProvider(create: (context) => OTPVM()),


      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = const {
      50: Color.fromRGBO(4, 131, 184, .1),
      100: Color.fromRGBO(4, 131, 184, .2),
      200: Color.fromRGBO(4, 131, 184, .3),
      300: Color.fromRGBO(4, 131, 184, .4),
      400: Color.fromRGBO(4, 131, 184, .5),
      500: Color.fromRGBO(4, 131, 184, .6),
      600: Color.fromRGBO(4, 131, 184, .7),
      700: Color.fromRGBO(4, 131, 184, .8),
      800: Color.fromRGBO(4, 131, 184, .9),
      900: Color.fromRGBO(4, 131, 184, 1),
    };
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ScreenUtilInit(
            designSize: Size(constraints.maxWidth, constraints.maxHeight),
            builder: (context2 , child) => MaterialApp(
              title: 'Appartment',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ),
                primarySwatch: MaterialColor(colorTheme.value, color),
              ),
              home: SplashScreen(),
              //  home: ManpowerShiftData(),
            ),
          );
        });
  }
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
