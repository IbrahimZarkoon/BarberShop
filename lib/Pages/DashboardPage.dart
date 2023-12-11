import 'dart:ui';
import 'package:barbershop/Pages/HomePage.dart';
import 'package:barbershop/Pages/StaffPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/model/options.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomAppBar.dart';
import '../CustomWidgets/CustomerDrawer.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key, required this.tabindex}) : super(key: key);

  int tabindex;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin{

  final userTabs = [
    HomePage(),
    StaffPage(),
    SizedBox(),
    SizedBox(),
    SizedBox()
  ];

  dynamic selected;
  var heart = false;


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this,initialIndex: widget.tabindex);
  }


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: black,
        endDrawer: Drawer(
          elevation: 10,
          clipBehavior: Clip.none,
          shadowColor: Colors.black.withOpacity(0.5),
          child:  CustomDrawer(),
        ),

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(),
        ),

        body: RepaintBoundary(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: userTabs)),

        bottomNavigationBar:  Stack(
          children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0),
            padding: const EdgeInsets.only(bottom: 0),
            child: CupertinoTabBar(
              height: MediaQuery.sizeOf(context).height*0.065,
              border: Border(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.75), width: 0.25)),
              backgroundColor: black,
              currentIndex: widget.tabindex,
              activeColor: primaryColor,
              inactiveColor: white.withOpacity(0.6),
              onTap: (index) {
                setState(() {
                  widget.tabindex = index;
                  _tabController.animateTo(index);
                });
              },
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    size: MediaQuery.sizeOf(context).height*0.035,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.content_cut_outlined,
                    size: MediaQuery.sizeOf(context).height*0.035,
                  ),
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.receipt_long_outlined,
                      size: MediaQuery.sizeOf(context).height*0.035,
                    ),
                    ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      CupertinoIcons.person_alt,
                      size: MediaQuery.sizeOf(context).height*0.035,
                    ),
                  ),

                ),
                // BottomNavigationBarItem(
                //   icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
                //   label: 'Keypad',
                // ),
              ],
            ),
          ),

            // Positioned(
            //     bottom: MediaQuery.sizeOf(context).height*0.035,
            //     left: MediaQuery.sizeOf(context).width*0.35,right: MediaQuery.sizeOf(context).width*0.35,
            //     child: Center(
            //       child: Container(
            //         constraints: BoxConstraints(
            //           maxHeight: MediaQuery.sizeOf(context).height*0.055
            //         ),
            //         alignment: Alignment.center,
            //         decoration: BoxDecoration(
            //           color: Color(0xff1beca1),
            //
            //           borderRadius: BorderRadius.circular(50),
            //           boxShadow: [
            //             BoxShadow(
            //               color: black.withOpacity(0.2),
            //               spreadRadius: 1,
            //               blurRadius: 1.5,
            //               offset: Offset(0,0)
            //             )
            //           ]
            //         ),
            //
            //         child: Text("Book Now",style: TextStyle(color: white,fontFamily: "OpenSans_Bold",fontSize: MediaQuery.sizeOf(context).height*0.017),),
            //       ),
            //     ))
        ]
        ),

        floatingActionButton: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height*0.055,
              maxWidth: MediaQuery.sizeOf(context).width*0.3
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff1beca1),

              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1.5,
                    offset: Offset(0,0)
                )
              ]
          ),

          child: Text("Book Now",style: TextStyle(color: white,fontFamily: "OpenSans_Bold",fontSize: MediaQuery.sizeOf(context).height*0.017),),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

}