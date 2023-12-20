import 'package:barbershop/Constants/colors.dart';
import 'package:barbershop/Pages/SplashScreen.dart';
import 'package:barbershop/modals/bookingProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: black, // Set the status bar color here
  ));
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

        create: (_) => BookingProvider(),
      child: MaterialApp(

          title: 'BarberShop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "OpenSans",
            useMaterial3: true,
            primaryColor: primaryColor
          ),
          home:  const SplashScreen()
      ),
    );
  }
}
