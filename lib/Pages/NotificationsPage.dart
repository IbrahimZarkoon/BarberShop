import 'package:barbershop/CustomWidgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  double _top = 0;

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
                // Padding(
                //   padding:
                //   const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Notifications",
                //         style: TextStyle(
                //             color: white,
                //             fontSize: 22,
                //         ),
                //       ),
                //        Text(
                //         "Mark all as read",
                //         style: TextStyle(
                //             color: primaryColor,
                //             fontSize: 11,
                //             fontWeight: FontWeight.normal),
                //       ),
                //     ],
                //   ),
                // ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return newNotifCon(
                        context,
                        "https://images.pexels.com/photos/2114703/pexels-photo-2114703.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        "",
                      DateFormat('yyyy-MM-dd H:mm').format(DateTime.now()),
                        "khan",
                        "Standard cut + Beard Shave",);
                  },
                ),
              ],
            )),
      ),
    );
  }

  Widget newNotifCon(BuildContext context, String image, String content,
      String time, String name, String title) {

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            builder: (BuildContext context) {
              return SizedBox();
            });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding:
        const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration:  BoxDecoration(color: Colors.white.withOpacity(0.1),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Image Container
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(0.5),
                // image: DecorationImage(
                //     image: NetworkImage(image),
                //     fit: BoxFit.cover
                // )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Icon(
                  CupertinoIcons.bell_fill,
                  color: primaryColor,
                  size: MediaQuery.sizeOf(context).height * 0.035,
                ),
              ),
            ),

            //Text Container
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style:  TextStyle(
                      color: primaryColor,
                      fontSize:  MediaQuery.sizeOf(context).height * 0.013,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text:
                          "Great news! Your booking #: 0048 has been confirmed.",
                          style: TextStyle(
                              color:white, fontSize: MediaQuery.sizeOf(context).height*0.018,fontFamily: "OpenSans"),
                        ),
                        //
                        // TextSpan(
                        //   text: "@$name",
                        //   style: const TextStyle(color: Color(0xff09426d),fontWeight: FontWeight.normal,fontSize: 11)
                        // ),
                      ])),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.sizeOf(context).height*0.018)),

                  const SizedBox(
                    height: 5,
                  ),

                 content.isNotEmpty? Text(
                    content,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: white.withOpacity(0.75),
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: MediaQuery.sizeOf(context).height*0.012,
                    ),
                  ) : SizedBox(),

                  //const SizedBox(height: 5,),

                  // Text("Digital Marketing Event",
                  //     style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold,fontSize: 13))
                ],
              ),
            ),

            const SizedBox(
              width: 5,
            ),

            //More Icon
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.more_horiz,
                  color: primaryColor,
                  size: 25,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}