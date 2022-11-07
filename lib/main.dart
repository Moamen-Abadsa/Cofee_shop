import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/my_provider.dart';
import 'package:coffee_shop/screens/about_screen.dart';
import 'package:coffee_shop/screens/add_cafe.dart';
import 'package:coffee_shop/screens/browse_cafe_screen.dart';
import 'package:coffee_shop/screens/contact_us_screen.dart';
import 'package:coffee_shop/screens/events_and_offers.dart';
import 'package:coffee_shop/screens/google_map.dart';
import 'package:coffee_shop/screens/home_screen.dart';
import 'package:coffee_shop/screens/menu_screens.dart';
import 'package:coffee_shop/screens/sign_in_screen.dart';
import 'package:coffee_shop/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider(),)
          ],
          child: mainMaterialApp()
        );
      },
    );
  }
}

class mainMaterialApp extends StatelessWidget {
  const mainMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: AppLocalizations.localizationsDelegates,

      // supportedLocales: AppLocalizations.supportedLocales,
      supportedLocales: [Locale("en"), Locale("ar")],
      locale: Locale(Provider.of<MyProvider>(context).languageCode),
      // locale: Locale('ar'),
      theme: ThemeData(
        // appBarTheme: AppBarTheme(color: Constants.appBarColor)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/add_cafe_screen',
      routes: {
        '/sign_up_screen': (context) => SignUpScreen(),
        '/sign_in_screen': (context) => SignInScreen(),
        '/contact_us_screen': (context) => ContactUS(),
        '/about_screen': (context) => AboutScreen(),
        '/events_and_offers_screen': (context) => EventsAndOffers(),
        '/browse_screen': (context) => BrowseCafeScreen(),
        '/menu_screen': (context) => MenuScreen(name: ""),
        '/home_screen': (context) => HomeScreen(),
        '/add_cafe_screen': (context) => AddCafe(),
        '/map_screen': (context) => MAP(latlon: LatLng(32.22, 32.22)),
      },
    );
  }
}

