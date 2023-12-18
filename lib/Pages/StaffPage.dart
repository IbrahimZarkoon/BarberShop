import 'package:barbershop/Pages/SingleStaffPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/Headings.dart';
import 'DashboardPage.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});

  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: black,
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(kToolbarHeight),
      //   child: GestureDetector(
      //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 0))),
      //     child: AppBar(
      //       leadingWidth: 30,
      //       leading: Padding(
      //         padding: const EdgeInsets.only(left: 15),
      //         child: Icon(Icons.keyboard_arrow_left,color: Colors.black.withOpacity(0.8),size: 25,),
      //       ),
      //       backgroundColor: Colors.white,
      //       elevation: 0.5,
      //       centerTitle: false,
      //       title: Text("Staff",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),),
      //       actions: [
      //         Container(
      //             margin: const EdgeInsets.only(top: 8,bottom: 8,right: 20,left: 20),
      //             padding: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(50),
      //                 color: const Color(0xfff1f1f1)
      //             ),
      //             child: Icon(Icons.person_outline,color: Colors.black.withOpacity(0.8),size: 20,)
      //         )
      //       ],
      //     ),
      //   ),
      // ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [black,white],
        //     begin: Alignment.topCenter,end: Alignment.bottomCenter,
        //     stops: [0.5,0.6]
        //   )
        // ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              //Staffs Container
              Container(
                margin: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
                decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.75),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0,0)
                      )
                    ]
                ),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "- Barbers -".toUpperCase(),
                            style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.025,
                              color: primaryColor,
                              fontFamily: "OpenSans_Bold",
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15,right: 15,bottom: 0),
                    //   child: shadowLine(context),
                    // ),

                    //1st Staff
                    staffCon(context, "Sandy",
                        "https://lh3.googleusercontent.com/jM2omLhuicxjvIRzhxH9BmnJP8RTjE505IdcpOLKNA57YQ8px5EOgAmZxH0tVcAlgFZDAFJM1ZXHDAqBizaZ5vYGPjux-DG3=s100",
                        "Tue/Wed/Thurs/Fri/Sat",false),

                    // Padding(
                    //     padding: const EdgeInsets.only(left: 15,right: 15),
                    //     child: shadowLine(context)),

                    //2nd Staff
                    staffCon(context, "Eddy",
                        "https://lh3.googleusercontent.com/Ns1cmuogrYYnzEElT5FWWtORnFkCnJPmGP1HtcBdbjamzDn9HTkaEdwDmxMUFEtfMcOhM6Nu1Lk_LRpaqbhlDahE6YxshQML=s100",
                        "Tue/Wed/Thurs/Fri/Sat",false),

                    // Padding(
                    //     padding: const EdgeInsets.only(left: 15,right: 15),
                    //     child: shadowLine(context)),

                    //3rd Staff
                    staffCon(context, "James",
                        "https://lh3.googleusercontent.com/6oQW60CQRB5umzboz2-7FGLYXzHKsQyIRXaJ0tFSYeK2DuZrFEZ2zmkRXwfcb7i1O9cByhMDS4RuLMSLMO4q-hnupoKtDa_3RQ=s100",
                        "Mon/Tue/Wed/Thurs/Fri/Sat",false),

                    // Padding(
                    //     padding: const EdgeInsets.only(left: 15,right: 15),
                    //     child: shadowLine(context)),

                    //4th Staff
                    staffCon(context, "Luke",
                        "https://lh3.googleusercontent.com/a6KTL7w4zgqo4fu_1sOqlrHGwe6QXzM4GriPxaXvcfNST0UshxYlcTa7ASQt0ErzGPOzkefLNfsQ23n6O_nXqA68iqivwF7tCEQpiPS5bekMWQ=s100",
                        "Mon/Wed/Thurs/Fri/Sat",false),

                    // Padding(
                    //     padding: const EdgeInsets.only(left: 15,right: 15),
                    //     child: shadowLine(context)),

                    //5th Staff
                    staffCon(context, "Will",
                        "https://avatar.anywhere.app/files/img/fZKOaznkAtQZ/profilepic.png",
                        "Saturday's",true),
                  ],
                ),
              ),

              //Contact Info Container
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(bottom: 0),
                decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.75),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0,0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "- Contact info -".toUpperCase(),
                            style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.025,
                              color: primaryColor,
                              fontFamily: "OpenSans_Bold",
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15,right: 15,bottom: 0),
                    //   child: shadowLine(context),
                    // ),

                    Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                        color: black,
                      ),
                      child: Column(
                        children: [
                          //Image Container
                          Container(
                            margin: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.2,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/GoogleMaps.png"),fit: BoxFit.cover
                                )
                            ),
                          ),

                          //Location Row
                          Container(
                            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                const Icon(Icons.location_on,size: 25,color: Color(
                                    0xffe30d0d),),

                                const SizedBox(width: 5,),

                                 Text("4 Mitchell St East Doncaster",
                                  maxLines: 2,
                                  style: TextStyle(color: primaryColor,fontSize: 14,),)
                              ],
                            ),
                          ),

                          //Phone Row
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                 Icon(Icons.phone,size: 25,color: white.withOpacity(0.85),),

                                const SizedBox(width: 5,),

                                 Text("+61 398402133",
                                  maxLines: 2,
                                  style: TextStyle(color: primaryColor,fontSize: 14,),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),

              //Business Hours Container
              Container(
                margin: const EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 15),
                padding: const EdgeInsets.only(bottom: 0),

                decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.75),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0,0)
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "- Business hours -".toUpperCase(),
                            style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.025,
                              color: primaryColor,
                              fontFamily: "OpenSans_Bold",
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                    //   child: shadowLine(context),
                    // ),

                    //Monday Timings
                    Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                        color: black,
                      ),
                      child: Column(
                        children: [
                          timingsCon(context, "Monday", "9:00 am - 5:30 pm",false),

                          //Tuesday Timings
                          timingsCon(context, "Tuesday", "9:00 am - 5:30 pm",false),

                          //Wednesday Timings
                          timingsCon(context, "Wednesday", "9:00 am - 5:30 pm",false),

                          //Thursday Timings
                          timingsCon(context, "Thursday", "9:00 am - 6:00 pm",false),

                          //Friday Timings
                          timingsCon(context, "Friday", "9:00 am - 6:00 pm",false),

                          //Saturday Timings
                          timingsCon(context, "Saturday", "9:00 am - 4:00 pm",false),

                          //Sunday Timings
                          timingsCon(context, "Sunday", "Closed",true),
                        ],
                      ),
                    ),

                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }

  Widget timingsCon(BuildContext context, String day, String timing,bool last)
  {
    DateTime now = DateTime.now();
    String currentDay = DateFormat('EEEE').format(now);

    return Container(
      decoration: BoxDecoration(
          color: currentDay == day ?  primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(7)
      ),
      margin: EdgeInsets.only(left: 10,right: 10,bottom: last? 0 : 15),
      padding: EdgeInsets.only(left: 10,right: 10,top: currentDay == day ? 5:0, bottom: currentDay == day ? 5:0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(day,style: TextStyle(fontWeight: currentDay == day ? FontWeight.bold : FontWeight.normal,color: currentDay == day ? Colors.black.withOpacity(0.8) : white,fontSize: currentDay == day ? MediaQuery.sizeOf(context).height*0.018 : MediaQuery.sizeOf(context).height*0.016),),

          Text(timing,style: TextStyle(fontWeight: currentDay == day ? FontWeight.bold : FontWeight.normal,color: currentDay == day ? Colors.black.withOpacity(0.8) : white,fontSize: currentDay == day ? MediaQuery.sizeOf(context).height*0.018 : MediaQuery.sizeOf(context).height*0.016),)
        ],
      ),
    );
  }

  Widget staffCon(BuildContext context,String name, String image, String days,bool isLast)
  {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SingleStaffPage(image: image,title: name,selectedService: " ",) ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius:isLast? BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)): BorderRadius.circular(0),
          color: black.withOpacity(0.5),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            //Image and Title Row
            Row(

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
                            image,
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                ),

                //Name & Days Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(name,style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.02,fontWeight: FontWeight.bold,color: primaryColor.withOpacity(0.8)),),

                    //const SizedBox(height: 5,),

                    Text(days,style: TextStyle(fontSize: MediaQuery.sizeOf(context).height*0.018,fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.6)),),

                  ],
                )

              ],
            ),

            Icon(Icons.keyboard_arrow_right,size: 25,color: primaryColor.withOpacity(0.8),)

          ],
        ),
      ),
    );
  }
}
