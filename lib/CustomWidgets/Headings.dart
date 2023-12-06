import 'package:flutter/cupertino.dart';

import '../Constants/colors.dart';

Widget headings(context,String heading)
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(heading,
      maxLines: 1,
          style: TextStyle(
            color: white,
            fontSize: MediaQuery.sizeOf(context).height*0.025,
            fontFamily: "OpenSans_Bold"
          ),),
    ],
  );
}