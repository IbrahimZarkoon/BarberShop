import 'package:barbershop/Pages/LoginPage.dart';
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
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.025,bottom: MediaQuery.sizeOf(context).height*0.025),
      height: MediaQuery.sizeOf(context).height,
      color: black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [

          SizedBox(
              height: MediaQuery.sizeOf(context).height*0.1,
              width: MediaQuery.sizeOf(context).width,

              child: Padding(
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.01),
                child: Image.asset("assets/images/logo.png",color: white,),
              )
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),

          InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 0))),
              child: drawerCon("HOME")),

          InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 1))),
              child: drawerCon("Barbers")),

          InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 4))),
              child: drawerCon("Appointments")),

          InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(tabindex: 5))),
              child: drawerCon("Profile")),

          InkWell(
              onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const LoginPage())),
              child: drawerCon("Logout")),

        ],
      ),
    );
  }

  Widget drawerCon(String title)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: white.withOpacity(0.75),width: 0.5))
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: TextStyle(color: primaryColor,fontSize: MediaQuery.sizeOf(context).height*0.028),)
        ],
      ),
    );
  }

  Widget drawerSubCon(String title,bool islast)
  {
    return Container(
      decoration: islast? const BoxDecoration() : BoxDecoration(
          border: Border(bottom: BorderSide(color: black.withOpacity(0.2),width: 0.5))
      ),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: TextStyle(color: Colors.black,fontSize: MediaQuery.sizeOf(context).height*0.012),)
        ],
      ),
    );
  }

  Widget drawerAcc(String title,bool isExpanded, List<Widget> subCon)
  {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: black.withOpacity(0.2),width: 0.5))
      ),
      child: ExpansionTile(
        //childrenPadding: EdgeInsets.all(20),
        tilePadding: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.015),
        iconColor: black,
        collapsedIconColor: black,
        title: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015,left: MediaQuery.sizeOf(context).height*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(title,style: TextStyle(color: black,fontSize: MediaQuery.sizeOf(context).height*0.014,fontWeight: FontWeight.normal),)
            ],
          ),
        ),
        children: subCon,
        onExpansionChanged: (bool expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
      ),
    );
  }
}