import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class BookingStepper extends StatefulWidget {
  @override
  _BookingStepperState createState() => _BookingStepperState();

  BookingStepper({super.key, required this.stepIndex});

  int stepIndex;
}

class _BookingStepperState extends State<BookingStepper> {


  List<StepperData> stepperData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stepperData =  [

      //Scheduled
      StepperData(
          title: StepperText("Scheduled",
          textStyle:TextStyle(color: black, fontFamily: "OpenSans",fontWeight: FontWeight.bold,),),
          iconWidget: Container(
            //padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
              color:primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Center(child: Text("1",style: TextStyle(color: white,fontSize: 18),)),
          )),

      //Confirmed
      StepperData(
          title: StepperText("Confirmed",
          textStyle: widget.stepIndex > 0?  TextStyle(color: black, fontFamily: "OpenSans",fontWeight: FontWeight.bold,) : TextStyle(color: black.withOpacity(0.75), fontFamily: "OpenSans",fontWeight: FontWeight.normal) ),
          iconWidget: Container(
           // padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: widget.stepIndex > 0? primaryColor : white,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Center(child: Text("2",style: TextStyle(color: widget.stepIndex > 0? white : black,fontSize: 18),)),
          )),

      //Completed
      StepperData(
          title: StepperText("Completed",
              textStyle:widget.stepIndex > 1?  TextStyle(color: black, fontFamily: "OpenSans",fontWeight: FontWeight.bold,) : TextStyle(color: black.withOpacity(0.75), fontFamily: "OpenSans",fontWeight: FontWeight.normal) ),
          iconWidget: Container(
            //padding: const EdgeInsets.all(8),
            decoration:  BoxDecoration(
                color: widget.stepIndex > 1? primaryColor : white,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: Center(child: Text("3",style: TextStyle(color:widget.stepIndex > 1? white : black,fontSize: 18),)),
          )

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: stepperData,
      stepperDirection: Axis.horizontal,
      iconWidth: 30,
      iconHeight: 30,
      activeBarColor: primaryColor,

      inActiveBarColor: white,
      inverted: true,
      verticalGap: 30,
      activeIndex: widget.stepIndex,
      barThickness: 5,
    );
  }
}