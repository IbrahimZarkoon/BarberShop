import 'package:barbershop/CustomWidgets/BookingStepper.dart';
import 'package:barbershop/Pages/SingleBookingPage.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key});

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                color: primaryColor,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.025,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("UPCOMING",
                            maxLines: 1,
                            style: TextStyle(
                                color: black,
                                fontSize: MediaQuery.sizeOf(context).height*0.025,
                                fontFamily: "OpenSans_Bold"
                            ),),
                        ],
                      ),
                    ),

                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.02),
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [

                        activeBookingCon(
                          "https://lh3.googleusercontent.com/jM2omLhuicxjvIRzhxH9BmnJP8RTjE505IdcpOLKNA57YQ8px5EOgAmZxH0tVcAlgFZDAFJM1ZXHDAqBizaZ5vYGPjux-DG3=s100",
                          "Standard Cut",
                          "453",
                          "31/12/2023",
                          "5:00 PM",
                          "4 Mitchell St East Doncaster",
                            "John Doe",
                          1
                        ),

                        activeBookingCon(
                            "https://lh3.googleusercontent.com/Ns1cmuogrYYnzEElT5FWWtORnFkCnJPmGP1HtcBdbjamzDn9HTkaEdwDmxMUFEtfMcOhM6Nu1Lk_LRpaqbhlDahE6YxshQML=s100",
                            "Standard Cut + Beard",
                            "357",
                            "20/12/2023",
                            "9:00 PM",
                            "4 Mitchell St East Doncaster",
                            "Eddy",
                            0
                        ),

                      ],
                    ),
                  ],
                ),
              ),

              //Past Booking Con
              Container(
                color: black,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.025,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("PAST BOOKINGS",
                            maxLines: 1,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: MediaQuery.sizeOf(context).height*0.025,
                                fontFamily: "OpenSans_Bold"
                            ),),
                        ],
                      ),
                    ),

                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.02),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [

                        pastBookingCon(
                            "https://lh3.googleusercontent.com/jM2omLhuicxjvIRzhxH9BmnJP8RTjE505IdcpOLKNA57YQ8px5EOgAmZxH0tVcAlgFZDAFJM1ZXHDAqBizaZ5vYGPjux-DG3=s100",
                            "Standard Cut",
                            "154",
                            "31/12/2023",
                            "5:00 PM",
                            "4 Mitchell St East Doncaster",
                            "John Doe",
                            2
                        ),

                        pastBookingCon(
                            "https://lh3.googleusercontent.com/jM2omLhuicxjvIRzhxH9BmnJP8RTjE505IdcpOLKNA57YQ8px5EOgAmZxH0tVcAlgFZDAFJM1ZXHDAqBizaZ5vYGPjux-DG3=s100",
                            "Standard Cut + Beard",
                            "100",
                            "20/12/2023",
                            "9:00 PM",
                            "4 Mitchell St East Doncaster",
                            "Eddy",
                            2
                        ),

                        pastBookingCon(
                            "https://lh3.googleusercontent.com/jM2omLhuicxjvIRzhxH9BmnJP8RTjE505IdcpOLKNA57YQ8px5EOgAmZxH0tVcAlgFZDAFJM1ZXHDAqBizaZ5vYGPjux-DG3=s100",
                            "Standard Cut",
                            "099",
                            "31/12/2023",
                            "5:00 PM",
                            "4 Mitchell St East Doncaster",
                            "John Doe",
                            2
                        ),


                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }

  Widget activeBookingCon(String img, String serviceTitle, String bookingNum, String date, String time, String loc, String barber, int step)
  {
    return InkWell(
      onTap: ()
      {
        showModalBottomSheet(
          isScrollControlled: true,
            context: context,
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
            builder: (BuildContext context)
        {
          return const SingleBookingPage();
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02,bottom: MediaQuery.sizeOf(context).height*0.02),
        padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.02,top: MediaQuery.sizeOf(context).height*0.02),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Top Row
            Container(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Image Container
                  Container(
                    width: 60,height: 60,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: black,
                        image: DecorationImage(
                            image: NetworkImage(
                              img,
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                  //Title Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(serviceTitle,style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.024,fontWeight: FontWeight.bold,color: black.withOpacity(0.8)),),

                      const SizedBox(height: 5,),

                      Text("Scheduled on: $date",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),
                      Text("Time: $time",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),
                      Text("Location: $loc",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),
                      Text("Specialist: $barber",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),


                    ],
                  ),

                  const Spacer(),

                  //Booking Number Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Text("#$bookingNum",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.02,fontWeight: FontWeight.bold,color: black.withOpacity(0.5)),),

                      //const SizedBox(height: 5,),


                    ],
                  ),

                ],
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

            BookingStepper(stepIndex: step),

          ],
        ),
      ),
    );
  }

  Widget pastBookingCon(String img, String serviceTitle, String bookingNum, String date, String time, String loc, String barber, int step)
  {
    return InkWell(
      onTap: ()
      {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
            builder: (BuildContext context)
            {
              return const SingleBookingPage();
            });
      },
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02,bottom: MediaQuery.sizeOf(context).height*0.02),
        padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.02,top: MediaQuery.sizeOf(context).height*0.02),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Top Row
            Container(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Image Container
                  Container(
                    width: 60,height: 60,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: black,
                        image: DecorationImage(
                            image: NetworkImage(
                              img,
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                  //Title Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(serviceTitle,style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.024,fontWeight: FontWeight.bold,color: black.withOpacity(0.8)),),

                      const SizedBox(height: 5,),

                      Text("Scheduled on: $date",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),
                      Text("Time: $time",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),
                      Text("Location: $loc",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),
                      Text("Specialist: $barber",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily:"OpenSans",color: black.withOpacity(0.8)),),


                    ],
                  ),

                  const Spacer(),

                  //Booking Number Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Text("#$bookingNum",style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.02,fontWeight: FontWeight.bold,color: black.withOpacity(0.5)),),

                      //const SizedBox(height: 5,),


                    ],
                  ),

                ],
              ),
            ),

            SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

            BookingStepper(stepIndex: step),

          ],
        ),
      ),
    );
  }
}
