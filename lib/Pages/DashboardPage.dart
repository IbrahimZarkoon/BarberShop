import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Container(width: 100,height: 100,color: Colors.red,),
    SizedBox(),
    SizedBox(),
    SizedBox(),

  ];


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: widget.tabindex);
  }


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          elevation: 10,
          clipBehavior: Clip.hardEdge,
          shadowColor: Colors.black.withOpacity(0.5),
          child:  CustomDrawer(),
        ),

        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: widget.tabindex == 3? SizedBox() : CustomAppBar(),
        ),

        body: RepaintBoundary(
            child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: userTabs)),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () { setState(() {
        //     widget.tabindex = 2;
        //     _tabController.animateTo(widget.tabindex);
        //
        //   }); },
        //   backgroundColor: Color(0xff00afef),
        //   child: Icon(Icons.find_in_page),
        // ),


        bottomNavigationBar:  Container(
          decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 1.5,
                    spreadRadius: 0,
                    offset: const Offset(0,-1)
                )
              ]
          ),
          height: kToolbarHeight,
          child: TabBar(
            dividerColor: const Color(0xfff1f1f1),
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            indicator:  BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: white,
                  width: 3.0,
                ),
              ),
            ),
            controller: _tabController,
            indicatorColor: white,
            unselectedLabelColor: Colors.black.withOpacity(0.35),
            labelColor:  primaryColor,
            labelStyle:  TextStyle(
                fontSize: MediaQuery.sizeOf(context).width*0.014
            ),

            onTap: (int index)
            {
              setState(() {
                widget.tabindex = index;
              });
            },
            tabs: [


              Tab(
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: Icon(widget.tabindex == 0? Icons.home : Icons.home_outlined,size: MediaQuery.sizeOf(context).width*0.025,),
                child:  Flexible(child: Text("Home",style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.014),)),
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 0),
                icon: Icon(widget.tabindex == 1? Icons.table_bar :Icons.table_bar_outlined,size: MediaQuery.sizeOf(context).width*0.025),
                child: Flexible(child: Text("Tables",style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.014),)),
              ),
              Tab(
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: Icon(widget.tabindex == 2? Icons.receipt_long :Icons.receipt_long_outlined,size: MediaQuery.sizeOf(context).width*0.025),
                child: Flexible(child: Text("Orders",style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.014),)),

              ),
              Tab(
                iconMargin: const EdgeInsets.only(bottom: 0),
                icon: Icon(widget.tabindex == 3? Icons.person_2 :Icons.person_2_outlined,size: MediaQuery.sizeOf(context).width*0.025),
                child: Flexible(child: Text("Profile",style: TextStyle(fontSize: MediaQuery.sizeOf(context).width*0.014),)),

              ),
            ],
          ),
        ),
      ),
    );
  }

}