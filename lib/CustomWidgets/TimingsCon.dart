import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/colors.dart';

Widget timingsCon(BuildContext context, String day, String timing,bool last)
{
  DateTime now = DateTime.now();
  String currentDay = DateFormat('EEEE').format(now);

  return Container(
    decoration: BoxDecoration(
        color: currentDay == day ?  primaryColor : Colors.transparent,
      borderRadius: BorderRadius.circular(7)
    ),
    margin: EdgeInsets.only(left: 10,right: 10,bottom: last? 0 : 15),
    padding: EdgeInsets.only(left: 5,right: 5,top: currentDay == day ? 5:0, bottom: currentDay == day ? 5:0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(day,style: TextStyle(fontWeight: currentDay == day ? FontWeight.bold : FontWeight.normal,color: Colors.black.withOpacity(0.8),fontSize: currentDay == day ? 14 : 13),),

        Text(timing,style: TextStyle(fontWeight: currentDay == day ? FontWeight.bold : FontWeight.normal,color: Colors.black.withOpacity(0.8),fontSize: currentDay == day ? 14 : 13),)
      ],
    ),
  );
}