import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomerDrawer.dart';
import 'SingleStaffPage.dart';

class SingleServicePage extends StatefulWidget {
  SingleServicePage({super.key,required this.image,required this.serviceTitle});

  String image;
  String serviceTitle;

  @override
  State<SingleServicePage> createState() => _SingleServicePageState();
}

class _SingleServicePageState extends State<SingleServicePage> {

  final _selectedDate = DateTime.now();

  // Calculate disabled dates that are earlier than the current date
  List<DateTime> myDisabledDates = List.generate(
    DateTime.now().difference(DateTime.now().subtract(const Duration(days: 365))).inDays, // Use the current day as the number of disabled dates
        (index) => DateTime.now().subtract(Duration(days: index + 1)),
  );

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
        child:  const CustomDrawer(),
      ),

      backgroundColor: black.withOpacity(0.02),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Top Details Con
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.025),
              decoration: BoxDecoration(
                  color: primaryColor
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
                        color: black,
                        image: DecorationImage(
                            image: AssetImage(widget.image),fit: BoxFit.scaleDown,filterQuality: FilterQuality.high
                        )
                    ),
                  ),

                  //Name Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text(widget.serviceTitle,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                        fontFamily: "OpenSans_Bold",
                        fontSize: MediaQuery.sizeOf(context).height*0.045,
                        color: Colors.black,
                      ),),

                      Text("Service",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: MediaQuery.sizeOf(context).height*0.0325,
                        color: Colors.black,
                      ),),

                    ],
                  ),



                ],

              ),
            ),

            //Staffs Container
            Container(
              margin: const EdgeInsets.only(top: 30,left: 15,right: 15,bottom: 15),
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
                          "- Available Barbers -".toUpperCase(),
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


          ],
        ),
      ),
    );
  }

  Widget staffCon(BuildContext context,String name, String image, String days,bool isLast)
  {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SingleStaffPage(image: image,title: name,selectedService: widget.serviceTitle,) ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius:isLast? const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)): BorderRadius.circular(0),
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

