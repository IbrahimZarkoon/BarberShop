import 'package:barbershop/Pages/LoginPage.dart';
import 'package:barbershop/Pages/RegisterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750), // Adjust the duration of the animation.
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Adjust the animation curve.
    ));

    // Start the animation when the screen is loaded.
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //var regOrgProv = Provider.of<RegisterOrgProvider>(context,listen: false);

    return SlideTransition(
      position: _animation,
      child: Material(
        child: Stack(
          children: [
            //Main Image Con
            Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    black.withOpacity(0.75),
                  ],
                  stops: [0.5,0.6],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/SplashScrImage.jpg"),
                      fit: BoxFit.cover)),
            ),

            //Details Positioned
            Positioned(
              left: MediaQuery.sizeOf(context).height*0.02,
                right: MediaQuery.sizeOf(context).height*0.02,
                bottom: MediaQuery.sizeOf(context).height*0.04,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    
                    Text("LET'S GET STARTED",
                    maxLines: 2,
                    style: TextStyle(
                      color: white,
                      fontFamily: "OpenSans_Bold",
                      fontSize: MediaQuery.sizeOf(context).height*0.05
                    ),),

                    SizedBox(height: MediaQuery.sizeOf(context).height*0.02),

                    Text("The best is yet to come...",
                      maxLines: 2,
                      style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontFamily: "OpenSans_SemiBold",
                          fontSize: MediaQuery.sizeOf(context).height*0.024
                      ),),


                    //Join Now Con
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage())),
                      child: Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.02,top: MediaQuery.sizeOf(context).height*0.02),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.02),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text("Join Now",
                        style: TextStyle(
                          color: black,
                          fontFamily: "OpenSans_Bold",
                          fontSize: MediaQuery.sizeOf(context).height*0.02
                        ),),
                      ),
                    ),

                    //Login Row
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text:  TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "",
                                      fontSize: MediaQuery.sizeOf(context).height*0.018,
                                      color: white.withOpacity(0.7)),
                                ),
                                TextSpan(
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.sizeOf(context).height*0.018),
                                  text:
                                  'Login',
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )


                  ],
                ))
          ]
        ),
      )
    );
  }
}