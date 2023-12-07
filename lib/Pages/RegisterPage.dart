import 'package:barbershop/Pages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants/colors.dart';
import '../CustomWidgets/Headings.dart';
import 'DashboardPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin{
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();


  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();

  bool obPass = true;
  bool agree = false;

  late AnimationController _controller;
  late Animation<Offset> _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750), // Adjust the duration of the animation.
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut, // Adjust the animation curve.
        ));

    // Start the animation when the screen is loaded.
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _phoneCtrl.dispose();
    _emailNode.unfocus();
    _passNode.unfocus();
    _phoneNode.unfocus();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: black,
      body: SlideTransition(
        position: _animation,

        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: height * 0.04,left: height * 0.02,right: height * 0.02),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: white,
                      fontFamily: "OpenSans_Bold",
                      fontSize: height * 0.035),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  "Create new account",
                  maxLines: 2,
                  style: TextStyle(
                      color: white.withOpacity(0.7),
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: height * 0.016),
                ),
                SizedBox(height: height * 0.05),
                headings(context, 'Email Address'),
                emailCon(),

                headings(context, 'Mobile No.'),
                phoneCon(),

                headings(context, 'Password'),
                passCon(),

                //Checkbox Row
                InkWell(
                  onTap: ()
                  {
                    setState(() {
                      agree = !agree;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: white,
                        activeColor: primaryColor,
                        value: agree, // Set the initial value accordingly
                        onChanged: (bool? value) {

                          // Handle checkbox state changes here
                        },
                      ),
                      Text('I Agree to the terms and conditions.',style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontFamily: "OpenSans_SemiBold",
                          fontSize: height * 0.016),),
                    ],
                  ),
                ),

                //Sign Up Con
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())),
                  child: Container(
                    margin: EdgeInsets.only(top: height*0.04,bottom: height*0.02),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*0.015),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text("Sign Up",
                      style: TextStyle(
                          color: black,
                          fontFamily: "OpenSans_Bold",
                          fontSize: MediaQuery.sizeOf(context).height*0.02
                      ),),
                  ),
                ),

                //Login Row
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text:  TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "",
                                  fontSize: MediaQuery.sizeOf(context).height*0.018,
                                  color: white.withOpacity(0.7)),
                            ),
                            TextSpan(
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.sizeOf(context).height*0.018),
                              text:
                              'Login',
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpCon(String title, String imgURL)
  {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(height*0.01),
          margin:  EdgeInsets.only(bottom: height*0.03),

          //alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //border: Border.all(width: 2),
            color: Colors.white.withOpacity(0.4),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                  width: height*0.04, height: height*0.04 ,
                  child:  Image(image: NetworkImage(imgURL),fit: BoxFit.cover,)),


              SizedBox(width:height*0.01),


              Text(title,style: TextStyle(color: white),)

            ],
          )
      ),
    );
  }

  Widget emailCon() {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints: BoxConstraints(maxHeight: height * 0.06),
      margin: EdgeInsets.only(bottom: height * 0.02, top: height * 0.01),
      width: width,
      padding: EdgeInsets.only(left: height * 0.015, right: height * 0.015),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        cursorColor: white,

        style: TextStyle(color: Colors.white.withOpacity(1), fontSize: height * 0.018),
        focusNode: _emailNode,
        controller: _emailCtrl,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 5),
          border: InputBorder.none,
          hintText: "Username / Email",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: height * 0.018),
          icon: Icon(CupertinoIcons.person, color: Colors.white.withOpacity(1)),
          alignLabelWithHint: true, // Align hint text with the center
        ),
      ),
    );
  }

  Widget passCon() {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints: BoxConstraints(maxHeight: height * 0.06),
      margin: EdgeInsets.only(bottom: height * 0.02, top: height * 0.01),
      width: width,
      padding: EdgeInsets.only(left: height * 0.015, right: height * 0.015),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: white,
              style: TextStyle(color: Colors.white.withOpacity(1), fontSize: height * 0.018),
              controller: _passCtrl,
              focusNode: _passNode,
              obscureText: obPass,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 5),
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: height * 0.018),
                icon: Icon(CupertinoIcons.lock, color: Colors.white.withOpacity(1)),
                alignLabelWithHint: true, // Align hint text with the center
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                obPass = !obPass;
              });
            },
            child: Icon(
              obPass ? CupertinoIcons.eye : CupertinoIcons.eye_fill,
              color: Colors.white.withOpacity(1),
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneCon() {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      constraints: BoxConstraints(maxHeight: height * 0.06),
      margin: EdgeInsets.only(bottom: height * 0.02, top: height * 0.01),
      width: width,
      padding: EdgeInsets.only(left: height * 0.015, right: height * 0.015),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        cursorColor: white,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')), // Allow digits and +
        ],
        keyboardType: TextInputType.phone,
        style: TextStyle(color: Colors.white.withOpacity(1), fontSize: height * 0.018),
        focusNode: _phoneNode,
        controller: _phoneCtrl,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 5),
          border: InputBorder.none,
          hintText: "Enter Your Mobile Number",
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: height * 0.018),
          icon: Icon(CupertinoIcons.phone, color: Colors.white.withOpacity(1)),
          alignLabelWithHint: true, // Align hint text with the center
        ),
      ),
    );
  }
}
