import 'package:barbershop/CustomWidgets/Headings.dart';
import 'package:barbershop/modals/bookingProvider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/CustomerDrawer.dart';
import '../CustomWidgets/servicesCon.dart';

class SingleStaffPage extends StatefulWidget {
   SingleStaffPage({super.key,required this.image,required this.title,required this.selectedService});

  String image;
  String title;
  String selectedService;

  @override
  State<SingleStaffPage> createState() => _SingleStaffPageState();
}

class _SingleStaffPageState extends State<SingleStaffPage> {

  var _selectedDate = DateTime.now();

  int selectedServiceIndex = -1;

  List<List<String>> serviceList = [
    ["Hair Cut", "assets/images/HairCut_Icon.png"],
    ["Shaving", "assets/images/Shaving.png"],
    ["Cream Bath", "assets/images/creamBath.png"],
    ["Hair Painting", "assets/images/HairCut_Icon.png"],
    ["Beard", "assets/images/beard.png"],
    ["Shaving + Oil", "assets/images/oil.png"],
  ];

  // Calculate disabled dates that are earlier than the current date
  List<DateTime> myDisabledDates = List.generate(
    DateTime.now().difference(DateTime.now().subtract(Duration(days: 365))).inDays, // Use the current day as the number of disabled dates
        (index) => DateTime.now().subtract(Duration(days: index + 1)),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var bookingProv = Provider.of<BookingProvider>(context);

     bookingProv.barber = widget.title;
     bookingProv.time = _selectedDate.toString();
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

      backgroundColor: black.withOpacity(0.02),
      body: Stack(
        children: [SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Top Details Con
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.025, right:MediaQuery.sizeOf(context).height*0.025,bottom: MediaQuery.sizeOf(context).height*0.025, ),
                decoration: BoxDecoration(
                  color: black
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    //Image Con
                    Container(
                      margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).height*0.025),
                      width: MediaQuery.sizeOf(context).width*0.225,
                      height: MediaQuery.sizeOf(context).width*0.225,
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
                          fontSize: MediaQuery.sizeOf(context).height*0.03,
                          color: white,
                        ),),

                        Text("Barberman",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: MediaQuery.sizeOf(context).height*0.0225,
                          color: primaryColor,
                        ),),

                      ],
                    ),



                  ],

                ),
              ),

              //Time Slot Con
              timeSlotCon(),

              Padding(
                padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015,bottom: MediaQuery.sizeOf(context).height*0.015,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("CHOOSE YOUR TIME",
                      maxLines: 1,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: MediaQuery.sizeOf(context).height*0.0225,
                          fontFamily: "OpenSans_Bold"
                      ),),
                  ],
                ),
              ),

              TimeSlotsGrid(),

              Container(
                padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.015),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(color: primaryColor),
                // Other properties for your container, e.g., width, height, padding, etc.
                width: MediaQuery.of(context).size.width,

                // Your content goes here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.0,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("CHOOSE SERVICE",
                            maxLines: 1,
                            style: TextStyle(
                                color: black,
                                fontSize: MediaQuery.sizeOf(context).height*0.0225,
                                fontFamily: "OpenSans_Bold"
                            ),),
                        ],
                      ),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,

                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 5,right: 5,bottom: MediaQuery.sizeOf(context).height*0.075),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 0
                        ),
                        itemCount: serviceList.length ?? 0,
                        itemBuilder: (context,index)
                        {
                          return InkWell(
                            onTap: ()
                            {
                              setState(() {
                                selectedServiceIndex = index;
                                bookingProv.service = serviceList[index].first;

                              });
                            },
                            child: staffServicesCon(context, serviceList[index].first,
                                serviceList[index].last, false,index),
                          );
                        }
                    ),
                  ],
                ),
              )

            ],
          ),
        ),

       if(bookingProv.time.isNotEmpty && bookingProv.barber.isNotEmpty && bookingProv.service.isNotEmpty && bookingProv.date.isNotEmpty) Positioned(

            bottom: 15,left: 15,right: 15,
            child: Container(
          margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.04),
          alignment: Alignment.center,
          padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * 0.015),
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: primaryColor,width: 2),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            "Confirm Booking",
            style: TextStyle(
                color: primaryColor,
                fontFamily: "OpenSans_Bold",
                fontSize: MediaQuery.sizeOf(context).height * 0.02),
          ),
        ))
        ]
      ),
    );
  }

  Widget timeSlotCon()
  {
    var bookingProv = Provider.of<BookingProvider>(context);

    return Container(
      padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).height*0.02,right: MediaQuery.sizeOf(context).height*0.02,bottom: MediaQuery.sizeOf(context).height*0.015,top: MediaQuery.sizeOf(context).height*0.015),
      decoration: BoxDecoration(
        color: primaryColor,

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CHOOSE YOUR SLOT",
                  maxLines: 1,
                  style: TextStyle(
                      color: black,
                      fontSize: MediaQuery.sizeOf(context).height*0.0225,
                      fontFamily: "OpenSans_Bold"
                  ),),
              ],
            ),
          ),

          //Calender
          EasyDateTimeLine(

            timeLineProps: EasyTimeLineProps(
              hPadding: MediaQuery.sizeOf(context).height*0.015
            ),
            initialDate: _selectedDate,
            disabledDates: myDisabledDates,
            onDateChange: (selectedDate) {
              print(selectedDate);
              setState(() {
                _selectedDate = selectedDate;
                bookingProv.date = selectedDate.toString();
              });
            },
            headerProps:  EasyHeaderProps(
              showSelectedDate: true,
              showHeader: true,

              selectedDateStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: "OpenSans_SemiBold",
                  fontSize: MediaQuery.sizeOf(context).height*0.0225
              ),
              monthPickerType: MonthPickerType.switcher,
              monthStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: "OpenSans_SemiBold",
                  fontSize: MediaQuery.sizeOf(context).height*0.02
              ),
              selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY,
            ),

            dayProps:  EasyDayProps(
              height: MediaQuery.sizeOf(context).height*0.075,
              width: MediaQuery.sizeOf(context).height*0.055,
              todayStyle: DayStyle(

                dayStrStyle: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontFamily: "OpenSans",
                    fontSize: MediaQuery.sizeOf(context).height*0.02
                ),
                dayNumStyle: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontFamily: "OpenSans",
                    fontSize: MediaQuery.sizeOf(context).height*0.03
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: white.withOpacity(0.75),width: 2),

                  borderRadius: BorderRadius.circular(8),

                ),
              ),

              dayStructure: DayStructure.dayStrDayNum,

              inactiveDayStyle: DayStyle(
                borderRadius: 15,
                dayStrStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: "OpenSans",
                  fontSize: MediaQuery.sizeOf(context).height*0.018
              ),
                dayNumStyle: TextStyle(
                  color: Colors.black,
                  fontFamily: "OpenSans",
                  fontSize: MediaQuery.sizeOf(context).height*0.028
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent,width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),

                ),
              ),

              disabledDayStyle: DayStyle(

                dayStrStyle: TextStyle(
                    color: Colors.black.withOpacity(0.25),
                    fontFamily: "OpenSans",
                    fontSize: MediaQuery.sizeOf(context).height*0.018
                ),
                dayNumStyle: TextStyle(
                    color: Colors.black.withOpacity(0.25),
                    fontFamily: "OpenSans",
                    fontSize: MediaQuery.sizeOf(context).height*0.028
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: black.withOpacity(0.25),width: 2),

                  borderRadius: BorderRadius.circular(8),

                ),
              ),

              activeDayStyle: DayStyle(
                dayStrStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                    fontSize: MediaQuery.sizeOf(context).height*0.02
                ),
                dayNumStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                    fontSize: MediaQuery.sizeOf(context).height*0.03
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: black,width: 2),

                  borderRadius: BorderRadius.circular(8),

                ),
              ),
            ),
          ),



        ],
      ),

    );
  }

  Widget staffServicesCon(
      BuildContext context, String title, String image, bool isLast,int index) {

    var bookingProv = Provider.of<BookingProvider>(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: index == selectedServiceIndex? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            width:  MediaQuery.sizeOf(context).width *  0.2,
            height: MediaQuery.sizeOf(context).width * 0.2,
            padding:EdgeInsets.all(index == selectedServiceIndex?MediaQuery.sizeOf(context).height * 0.025 : MediaQuery.sizeOf(context).height * 0.015) ,
            child: Image.asset(
              image,
              color:index == selectedServiceIndex? primaryColor :  black,
              fit: index == selectedServiceIndex? BoxFit.scaleDown : BoxFit.scaleDown,
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
    );
  }
}


class TimeSlotsGrid extends StatefulWidget {
  @override
  _TimeSlotsGridState createState() => _TimeSlotsGridState();
}

class _TimeSlotsGridState extends State<TimeSlotsGrid> {
  // Generate a list of DateTime objects representing time slots
  List<String> timeSlots = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM",
    "06:00 PM",
    "07:00 PM",
    "08:00 PM",
    "09:00 PM"
  ];

  // Store the selected index
  int selectedTimeIndex = -1;

  @override
  Widget build(BuildContext context) {
    var bookingProv = Provider.of<BookingProvider>(context);

    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height*0.02,left: MediaQuery.sizeOf(context).height*0.025,right: MediaQuery.sizeOf(context).height*0.025),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: MediaQuery.of(context).size.height * 0.02,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
        childAspectRatio: 1,
        mainAxisExtent: MediaQuery.sizeOf(context).height*0.045,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Handle tap event to change the color
            setState(() {
              selectedTimeIndex = index;
              bookingProv.time = timeSlots[index];
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: selectedTimeIndex == index ? primaryColor : white.withOpacity(0.5),width: 0.5),
              color: selectedTimeIndex == index ? primaryColor : Colors.transparent
            ),
            child: Text(
              timeSlots[index],
              style: TextStyle(
                color: selectedTimeIndex == index ? black : white,
                fontFamily: selectedTimeIndex == index ? "OpenSans_SemiBold" : "OpenSans",
                fontSize:selectedTimeIndex == index ? MediaQuery.of(context).size.height * 0.02 : MediaQuery.of(context).size.height * 0.016,
              ),
            ),
          ),
        );
      },
    );
  }
}


