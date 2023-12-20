import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: black,//Color(0xff414342),
      // leading: InkWell(
      //     onTap: () => Scaffold.of(context).openDrawer(),
      //     child: Icon(Icons.menu,size: 25,color: Color(0xff00afef),)),
      leadingWidth: 0,
      centerTitle: false,
      title: SizedBox(
          width: MediaQuery.sizeOf(context).width*0.5,
          height: kToolbarHeight*0.8,
          child: Image.asset("assets/images/logo.png",fit: BoxFit.scaleDown,alignment: Alignment.centerLeft,color:Colors.white.withOpacity(1),)),
      automaticallyImplyLeading: false,

      actions: [

        InkWell(
            onTap: () => Scaffold.of(context).openEndDrawer(),
            child: Container(
                margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.02),
                child: Icon(Icons.menu,size: MediaQuery.sizeOf(context).height*0.035,color: primaryColor,))),

      ],

    );
  }
}