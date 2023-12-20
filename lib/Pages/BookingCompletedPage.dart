import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Routes/FadedRoute.dart';
import 'DashboardPage.dart';

class BookingCompletedPage extends StatefulWidget {
  const BookingCompletedPage({super.key});

  @override
  _BookedScreenState createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookingCompletedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000)); // Delay for 3 seconds to simulate a long operation
    Navigator.pushReplacement(context, FadeRoute(page: DashboardPage(tabindex: 1,))); // Navigate to home page
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),

    );
    navigateToHome();
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: black,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeInAnimation,
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height*0.2,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Image.asset("assets/images/Confirm_check.png",fit: BoxFit.contain,)
                        ),
                        Text(
                          'We send your booking request.',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height*0.03,
                            fontFamily: "OpenSans_Bold",color: white,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text(
                          'Your booking has been sent to the barber and we will confirm it with a notification shortly when the booking is accepted.',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height*0.025,
                            fontFamily: "OpenSans",color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),


                    InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1)));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width*0.4
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: primaryColor,width: 1)
                        ),
                        child: Text("Go to booking page",style: TextStyle(
                          color: primaryColor,fontSize: MediaQuery.sizeOf(context).height*0.02,

                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}