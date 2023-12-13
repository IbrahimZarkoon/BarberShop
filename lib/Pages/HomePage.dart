import 'package:barbershop/CustomWidgets/Headings.dart';
import 'package:barbershop/CustomWidgets/ParabolicText.dart';
import 'package:barbershop/Pages/SingleServicePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomAppBar.dart';
import '../CustomWidgets/CustomerDrawer.dart';
import '../CustomWidgets/TimingsCon.dart';
import '../CustomWidgets/servicesCon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> serviceList = [
    ["Hair Cut", "assets/images/HairCut_Icon.png"],
    ["Shaving", "assets/images/Shaving.png"],
    ["Cream Bath", "assets/images/creamBath.png"],
    ["Hair Painting", "assets/images/HairCut_Icon.png"],
    ["Beard", "assets/images/beard.png"],
    ["Shaving + Oil", "assets/images/oil.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      // endDrawer: Drawer(
      //   elevation: 10,
      //   clipBehavior: Clip.hardEdge,
      //   shadowColor: Colors.black.withOpacity(0.5),
      //   child: CustomDrawer(),
      // ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: CustomAppBar(),
      // ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: kToolbarHeight - 15),
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [black,white],
              stops: [0.5,0.5],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Top Con
              Stack(children: [

                //Welcome Curve Con
                Center(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularText(
                          children: [
                            TextItem(
                              text: Text(
                                "-WELCOME-".toUpperCase(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).height * 0.04,
                                  color: primaryColor,
                                  fontFamily: "OpenSans_Bold",
                                ),
                              ),
                              space: MediaQuery.sizeOf(context).height * 0.009,
                              startAngle: -90,
                              startAngleAlignment: StartAngleAlignment.center,
                              direction: CircularTextDirection.clockwise,
                            ),
                          ],
                          radius: MediaQuery.sizeOf(context).height * 0.225,
                          position: CircularTextPosition.outside,
                          backgroundPaint: Paint()..color = black,
                        ),
                      ],
                    ),
                  ),
                ),

                //Name Positioned
                Positioned(
                    left: 30,
                    right: 30,
                    top: 0,
                    bottom: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Zarkoon",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height * 0.035,
                            color: white.withOpacity(0.9),
                            fontFamily: "OpenSans_Bold",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet consectetuer adipiscing elit",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height * 0.02,
                            color: white.withOpacity(0.7),
                            fontFamily: "OpenSans_SemiBold",
                          ),
                        ),
                      ],
                    )),

                //Services Positioned
                Positioned(
                    left: 0,
                    top: MediaQuery.sizeOf(context).height * 0.15,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(color: white),
                      // Other properties for your container, e.g., width, height, padding, etc.
                      width: MediaQuery.of(context).size.width / 2,

                      // Your content goes here
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "- SERVICES -".toUpperCase(),
                            style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).height * 0.04,
                              color: black,
                              fontFamily: "OpenSans_Bold",
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.only(left: 5,right: 5),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10
                              ),
                              itemCount: serviceList.length ?? 0,
                              itemBuilder: (context,index)
                              {
                                return serviceCon(context, serviceList[index].first,
                                    serviceList[index].last, false);
                              }
                          ),
                        ],
                      ),
                    ))
              ]),


              //Business Hours Container
              Container(
                margin: const EdgeInsets.only(
                    bottom: 15, left: 15, right: 15, top: 0),
                padding: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 0))
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "- Business hours -".toUpperCase(),
                              style: TextStyle(
                                fontSize: MediaQuery.sizeOf(context).height * 0.025,
                                color: black,
                                fontFamily: "OpenSans_Bold",
                              ),
                            ),
                          ],
                        )),

                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: shadowLine(context),
                    ),

                    //Monday Timings
                    timingsCon(
                        context, "Monday", "9:00 am - 5:30 pm", false),

                    //Tuesday Timings
                    timingsCon(
                        context, "Tuesday", "9:00 am - 5:30 pm", false),

                    //Wednesday Timings
                    timingsCon(
                        context, "Wednesday", "9:00 am - 5:30 pm", false),

                    //Thursday Timings
                    timingsCon(
                        context, "Thursday", "9:00 am - 6:00 pm", false),

                    //Friday Timings
                    timingsCon(
                        context, "Friday", "9:00 am - 6:00 pm", false),

                    //Saturday Timings
                    timingsCon(
                        context, "Saturday", "9:00 am - 4:00 pm", false),

                    //Sunday Timings
                    timingsCon(context, "Sunday", "Closed", true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
