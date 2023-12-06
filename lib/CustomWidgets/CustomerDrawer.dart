import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Pages/DashboardPage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  bool settingsAcc = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width*0.015,bottom: MediaQuery.sizeOf(context).width*0.015),
      height: MediaQuery.sizeOf(context).height,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          Container(
              height: MediaQuery.sizeOf(context).height*0.1,
              child: Image.asset("assets/images/neraPOS_logo.png",)
          ),

          SizedBox(height: MediaQuery.sizeOf(context).width*0.05,),

          InkWell(
              onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => DashboardPage(tabindex: 0))),
              child: drawerCon("HOME")),

          InkWell(
              onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => DashboardPage(tabindex: 3))),
              child: drawerCon("Profile")),

          InkWell(
              //onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => SettingsPage())),
              child: drawerCon("Settings")),

          InkWell(
              //
              child: drawerCon("Logout")),

        ],
      ),
    );
  }

  Widget drawerCon(String title)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: black.withOpacity(0.2),width: 0.5))
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: TextStyle(color: black,fontSize: MediaQuery.sizeOf(context).width*0.014),)
        ],
      ),
    );
  }

  Widget drawerSubCon(String title,bool islast)
  {
    return Container(
      decoration: islast? BoxDecoration() : BoxDecoration(
          border: Border(bottom: BorderSide(color: black.withOpacity(0.2),width: 0.5))
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: TextStyle(color: Colors.black,fontSize: MediaQuery.sizeOf(context).width*0.012),)
        ],
      ),
    );
  }

  Widget drawerAcc(String title,bool _isExpanded, List<Widget> subCon)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: black.withOpacity(0.2),width: 0.5))
      ),
      child: ExpansionTile(
        //childrenPadding: EdgeInsets.all(20),
        tilePadding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.015),
        iconColor: black,
        collapsedIconColor: black,
        title: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).width*0.015,bottom: MediaQuery.sizeOf(context).width*0.015,left: MediaQuery.sizeOf(context).width*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(title,style: TextStyle(color: black,fontSize: MediaQuery.sizeOf(context).width*0.014,fontWeight: FontWeight.normal),)
            ],
          ),
        ),
        children: subCon,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}