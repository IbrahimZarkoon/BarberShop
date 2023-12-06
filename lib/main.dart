import 'package:barbershop/Constants/colors.dart';
import 'package:barbershop/Pages/DashboardPage.dart';
import 'package:barbershop/Pages/LoginPage.dart';
import 'package:barbershop/Pages/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'BarberShop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "OpenSans",
          useMaterial3: true,
          primaryColor: primaryColor
        ),
        home:  SplashScreen()
    );
  }
}
