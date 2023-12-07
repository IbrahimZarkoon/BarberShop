import 'package:barbershop/CustomWidgets/Headings.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomAppBar.dart';
import '../CustomWidgets/CustomerDrawer.dart';
import '../CustomWidgets/TimingsCon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      endDrawer: Drawer(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        shadowColor: Colors.black.withOpacity(0.5),
        child:  CustomDrawer(),
      ),
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            //Top Con
            Container(),

            //Business Hours Container
            Container(
              margin: const EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 15),
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
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

                  headings(context, "Business hours"),

                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                    child: shadowLine(context),
                  ),

                  //Monday Timings
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
      ),
    );
  }
}
