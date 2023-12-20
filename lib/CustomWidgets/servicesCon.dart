import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Pages/SingleServicePage.dart';

Widget serviceCon(
    BuildContext context, String title, String image, bool isLast) {
  return InkWell(
    onTap: () {
      isLast?
      Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SingleServicePage(image: image,serviceTitle: title,)))
          :
      Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SingleServicePage(image: image,serviceTitle: title,)));
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.sizeOf(context).width * 0.2,
            height: MediaQuery.sizeOf(context).width * 0.2,
            padding: const EdgeInsets.all(0),
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
                color: black,
                fontSize: MediaQuery.sizeOf(context).height * 0.018,
                fontFamily: "OpenSans_SemiBold"),
          )
        ],
      ),
    ),
  );
}