import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomerDrawer.dart';

class SingleStaffPage extends StatefulWidget {
   SingleStaffPage({super.key,required this.image});

  String image;

  @override
  State<SingleStaffPage> createState() => _SingleStaffPageState();
}

class _SingleStaffPageState extends State<SingleStaffPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: black,//Color(0xff414342),
        // leading: InkWell(
        //     onTap: () => Scaffold.of(context).openDrawer(),
        //     child: Icon(Icons.menu,size: 25,color: Color(0xff00afef),)),
        leadingWidth: 50,
        // centerTitle: false,
        // title: SizedBox(
        //     width: MediaQuery.sizeOf(context).width*0.5,
        //     height: kToolbarHeight*0.8,
        //     child: Image.asset("assets/images/logo.png",fit: BoxFit.scaleDown,alignment: Alignment.centerLeft,color:Colors.white.withOpacity(1),)),
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),

            child: Icon(Icons.arrow_back_ios_new,color: primaryColor,size: MediaQuery.sizeOf(context).height*0.03,)),

        actions: [

          InkWell(
              onTap: () => Scaffold.of(context).openEndDrawer(),
              child: Container(
                  margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.02),
                  child: Icon(Icons.menu,size: MediaQuery.sizeOf(context).height*0.035,color: primaryColor,))),

        ],

      ),
      endDrawer: Drawer(
        elevation: 10,
        clipBehavior: Clip.none,
        shadowColor: Colors.black.withOpacity(0.5),
        child:  CustomDrawer(),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Top Details Con
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.025),
              decoration: BoxDecoration(
                color: black
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  //Image Con
                  Container(
                    margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.015),
                    width: MediaQuery.sizeOf(context).width*0.3,
                    height: MediaQuery.sizeOf(context).width*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: NetworkImage("${widget.image}"),fit: BoxFit.cover,filterQuality: FilterQuality.high
                      )
                    ),
                  ),

                  //Name Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("JOHN DOE",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                        fontFamily: "OpenSans_Bold",
                        fontSize: MediaQuery.sizeOf(context).height*0.045,
                        color: white,
                      ),),

                      Text("Barberman",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                        fontFamily: "OpenSans_SemiBold",
                        fontSize: MediaQuery.sizeOf(context).height*0.0325,
                        color: primaryColor,
                      ),),

                    ],
                  )

                ],

              ),
            ),

            //Calender Con

          ],
        ),
      ),
    );
  }
}
