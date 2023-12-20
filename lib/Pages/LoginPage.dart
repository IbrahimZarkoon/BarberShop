import 'package:barbershop/CustomWidgets/Headings.dart';
import 'package:barbershop/Pages/DashboardPage.dart';
import 'package:barbershop/Pages/RegisterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passNode = FocusNode();

  bool obPass = true;

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 750), // Adjust the duration of the animation.
    );

    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Adjust the animation curve.
    ));

    // Start the animation when the screen is loaded.
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _emailNode.unfocus();
    _passNode.unfocus();
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
            padding: EdgeInsets.only(
                top: height * 0.04, left: height * 0.02, right: height * 0.02),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hi, Welcome Back!",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: white,
                      fontFamily: "OpenSans_Bold",
                      fontSize: height * 0.035),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  "Hello again, you,ve been missed!",
                  maxLines: 2,
                  style: TextStyle(
                      color: white.withOpacity(0.7),
                      fontFamily: "OpenSans_SemiBold",
                      fontSize: height * 0.016),
                ),
                SizedBox(height: height * 0.05),
                headings(context, 'Email Address'),
                emailCon(),
                headings(context, 'Password'),
                passCon(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // CupertinoSwitch(
                    //     activeColor: Color(0xff84ce41),
                    //     value: rememberMe, onChanged: (value){
                    //
                    //   setState(() {
                    //     rememberMe = value;
                    //   });
                    // } ),

                    const Spacer(),

                    Text(
                      "Forgot password",
                      style: TextStyle(
                          color: primaryColor,
                          fontFamily: "OpenSans_Bold",
                          fontSize: height * 0.016),
                    )
                  ],
                ),

                //Login Con
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DashboardPage(tabindex: 0))),
                  child: Container(
                    margin: EdgeInsets.only(top: height * 0.04),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(
                        MediaQuery.sizeOf(context).height * 0.015),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: black,
                          fontFamily: "OpenSans_Bold",
                          fontSize: MediaQuery.sizeOf(context).height * 0.02),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                      top: height * 0.04, bottom: height * 0.04),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: white.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        " Or Login With ",
                        maxLines: 1,
                        style: TextStyle(
                            color: white.withOpacity(0.9),
                            fontFamily: "OpenSans_SemiBold",
                            fontSize:
                                MediaQuery.sizeOf(context).height * 0.016),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),

                //GOOGLE FACEBOOK ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    signUpCon("Google",
                        "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"),

                    SizedBox(width: height * 0.03),

                    //FACEBOOK Container
                    signUpCon("Facebook",
                        "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/122_Facebook_F_logo_logos-512.png")

                    //Last Name Container
                  ],
                ),

                //Register Row
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const RegisterPage())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "",
                                  fontSize:
                                      MediaQuery.sizeOf(context).height * 0.018,
                                  color: white.withOpacity(0.7)),
                            ),
                            TextSpan(
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.sizeOf(context).height *
                                      0.018),
                              text: 'Sign Up',
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

  Widget signUpCon(String title, String imgURL) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Expanded(
      child: Container(
          padding: EdgeInsets.all(height * 0.01),
          margin: EdgeInsets.only(bottom: height * 0.03),

          //alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //border: Border.all(width: 2),
            color: Colors.white.withOpacity(0.4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: height * 0.04,
                  height: height * 0.04,
                  child: Image(
                    image: NetworkImage(imgURL),
                    fit: BoxFit.cover,
                  )),
              SizedBox(width: height * 0.01),
              Text(
                title,
                style: TextStyle(color: white),
              )
            ],
          )),
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
        style: TextStyle(
            color: Colors.white.withOpacity(1), fontSize: height * 0.018),
        focusNode: _emailNode,
        controller: _emailCtrl,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 5),
          border: InputBorder.none,
          hintText: "Username / Email",
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7), fontSize: height * 0.018),
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
              style: TextStyle(
                  color: Colors.white.withOpacity(1), fontSize: height * 0.018),
              controller: _passCtrl,
              focusNode: _passNode,
              obscureText: obPass,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 5),
                border: InputBorder.none,
                hintText: "Password",
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: height * 0.018),
                icon: Icon(CupertinoIcons.lock,
                    color: Colors.white.withOpacity(1)),
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
}
