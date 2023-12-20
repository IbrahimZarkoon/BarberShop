
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notifs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2));
        },
        color: primaryColor,
        backgroundColor: black,
        child: SingleChildScrollView(
            padding:  EdgeInsets.only(top: 0, bottom: MediaQuery.sizeOf(context).height*0.02),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Top Con
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.25)
                  ),
                  margin: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.02),
                  padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      //Image, Name Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //Image Container
                          Container(
                            width: MediaQuery.sizeOf(context).height*0.08,
                            height: MediaQuery.sizeOf(context).height*0.08,
                            margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.75),
                              image: DecorationImage(image:
                              NetworkImage("https://360degreebarbershop.com/wp-content/uploads/2023/03/juan-barber-pose-1.jpg"),
                              fit: BoxFit.cover)
                              // image: DecorationImage(
                              //     image: NetworkImage(image),
                              //     fit: BoxFit.cover
                              // )
                            ),
                          ),

                          //Name Column
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text("Ibrahim Khan Zarkoon",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                                fontFamily: "OpenSans_Bold",
                                fontSize: MediaQuery.sizeOf(context).height*0.025,
                                color: primaryColor,
                              ),),

                              Text("2464 Royal Ln. Mesa, New Jersey",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: MediaQuery.sizeOf(context).height*0.02,
                                color: white,
                              ),),

                            ],
                          ),

                        ],
                      ),

                      //Shadow
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.02,bottom: MediaQuery.sizeOf(context).height*0.02),
                        height: 1,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: white,
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              white,
                              white,
                              Colors.transparent,
                            ],
                            stops:
                              [
                                0.0,0.4,0.6,1
                              ]
                          )
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          Container(
                            width: MediaQuery.sizeOf(context).height*0.05,
                            height: MediaQuery.sizeOf(context).height*0.05,
                            margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.015),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.4),
                              // image: DecorationImage(
                              //     image: NetworkImage(image),
                              //     fit: BoxFit.cover
                              // )
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Icon(
                                  Icons.workspace_premium,
                                color: Color(0xfffccd33),
                                size: MediaQuery.sizeOf(context).height * 0.035,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Text("Gold Member",
                            style: TextStyle(
                              color: Color(0xfffccd33),
                              fontSize: MediaQuery.sizeOf(context).height*0.025,
                              fontFamily: "OpenSans"
                            ),),
                          ),

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02),
                            height: MediaQuery.sizeOf(context).height*0.05,
                            margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.015),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white.withOpacity(0.4),
                              // image: DecorationImage(
                              //     image: NetworkImage(image),
                              //     fit: BoxFit.cover
                              // )
                            ),
                            child: Text("58 Points",
                              maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.sizeOf(context).height*0.02,
                                  fontFamily: "OpenSans"
                              ),),
                          ),

                        ],
                      )

                    ],
                  ),
                ),

                profileCon(Icons.person_2_outlined, "Edit profile"),

                //Notif Con
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.25)
                  ),
                  margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02,top: MediaQuery.sizeOf(context).height*0.02),
                  padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [


                      //Icon Container
                      Container(
                        width: MediaQuery.sizeOf(context).height*0.05,
                        height: MediaQuery.sizeOf(context).height*0.05,
                        margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.02),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.25),
                          // image: DecorationImage(
                          //     image: NetworkImage(image),
                          //     fit: BoxFit.cover
                          // )
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Icon(
                              CupertinoIcons.bell_fill,
                            color: white,
                            size: MediaQuery.sizeOf(context).height * 0.03,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Text("Notifications",
                          style: TextStyle(
                              color: primaryColor,fontFamily: "OpenSans",fontSize: MediaQuery.sizeOf(context).height*0.0225
                          ),),
                      ),

                      CupertinoSwitch(
                          activeColor: primaryColor,
                          thumbColor: white,
                          value: notifs,
                          onChanged: (bool value)
                      {
                        setState(() {
                          notifs = value;
                        });
                      })

                    ],
                  ),
                ),

                profileCon(Icons.group_add_outlined, "Refer & Earn"),
                profileCon(Icons.privacy_tip_outlined, "Privacy policies"),
                profileCon(Icons.help_center_outlined, "Help center"),
                profileCon(Icons.power_settings_new_outlined, "Log out"),


              ],
            )),
      ),
    );
  }

  Widget profileCon(IconData iconData,String text)
  {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.25)
      ),
      margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02,top: MediaQuery.sizeOf(context).height*0.02),
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          //Icon Container
          Container(
            width: MediaQuery.sizeOf(context).height*0.05,
            height: MediaQuery.sizeOf(context).height*0.05,
            margin:  EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.02),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.25),
              // image: DecorationImage(
              //     image: NetworkImage(image),
              //     fit: BoxFit.cover
              // )
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Icon(
                iconData,
                color: white,
                size: MediaQuery.sizeOf(context).height * 0.03,
              ),
            ),
          ),

          Expanded(
            child: Text(text,
              style: TextStyle(
                  color: primaryColor,fontFamily: "OpenSans",fontSize: MediaQuery.sizeOf(context).height*0.0225
              ),),
          ),

          Icon(Icons.arrow_forward_ios,size: MediaQuery.sizeOf(context).height*0.025,color: primaryColor,)

        ],
      ),
    );
  }
}
