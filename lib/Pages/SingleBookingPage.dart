import 'package:barbershop/CustomWidgets/TimerWidget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/colors.dart';

class SingleBookingPage extends StatefulWidget {
  const SingleBookingPage({super.key});

  @override
  State<SingleBookingPage> createState() => _SingleBookingPageState();
}

class _SingleBookingPageState extends State<SingleBookingPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*0.75,
      //margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
      ),

      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Top Con
            Container(
              padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015,left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.05),width: 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
              ),
              child: Column(
                children: [

                  //AppBar Con
                  Container(
                    height: kToolbarHeight,
                    width: MediaQuery.sizeOf(context).width,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.keyboard_arrow_down,size: MediaQuery.sizeOf(context).height*0.03,color: primaryColor,)),
                      leadingWidth: 20,
                      centerTitle: true,
                      title: Text("Details",
                      style: TextStyle(
                        color: primaryColor,fontSize: MediaQuery.sizeOf(context).height*0.03
                      ),),
                    )
                  ),


                  //Timer Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("Will arrive in ",
                        style: TextStyle(
                            color: white,fontSize: MediaQuery.sizeOf(context).height*0.03
                        ),),

                      TimerWidget()
                    ],
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

                  //Top Details Con
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: black
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [

                        //Image Con
                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.025),
                          width: MediaQuery.sizeOf(context).width*0.2,
                          height: MediaQuery.sizeOf(context).width*0.2,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1.5,
                                offset: Offset(0,0)
                              )
                            ],
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/HairCut_Icon.png"),fit: BoxFit.scaleDown,filterQuality: FilterQuality.high
                              )
                          ),
                        ),

                        //Name Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text("JOHN DOE",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: MediaQuery.sizeOf(context).height*0.03,
                              color: white,
                            ),),

                            Text("Booking ID: 785632",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                              fontFamily: "OpenSans",
                              fontSize: MediaQuery.sizeOf(context).height*0.02,
                              color: Colors.white.withOpacity(0.5),
                            ),),

                          ],
                        ),

                        Spacer(),

                        InkWell(
                          onTap: () {
                            //launchMessagingApp("+92336","Hello");
            },
                          child: Container(
                            padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.01),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: white.withOpacity(0.5)
                            ),
                            child: Icon(Icons.phone_outlined),
                          ),
                        )



                      ],

                    ),
                  ),
                ],
              ),
            ),

            //Status Con
            Container(
              padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015,left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02),
              margin: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.05),width: 1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text("Status",
                  style: TextStyle(
                    color: white,
                    fontSize: MediaQuery.sizeOf(context).height*0.0225
                  ),),

                  Text("Confirmed",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: MediaQuery.sizeOf(context).height*0.0225
                    ),),

                ],
              ),
            ),

            //Details Con
            Container(
              padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015,left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02),
              margin: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.05),width: 1),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: //Title Column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Scheduled on: ",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.5)),),

                      Text("31/12/2023",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.8)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Time: ",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.5)),),

                      Text("5:00 PM",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.8)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Location: ",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.5)),),

                      Text("4 Mitchell St East Dancaster",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.8)),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Specialist: ",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.5)),),

                      Text("John Doe",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: white.withOpacity(0.8)),),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
