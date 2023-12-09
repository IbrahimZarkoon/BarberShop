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
            color: black,
            fontSize: MediaQuery.sizeOf(context).height*0.025,
            fontFamily: "OpenSans_Bold"
          ),),
    ],
  );
}

Widget shadowLine(BuildContext context)
{
  //Shadow Line Container
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    margin:
    const EdgeInsets.only(left: 0, right: 0),
    decoration: const BoxDecoration(
      color: Color(0xffd0d0d0),
    ),
  );
}
