import 'package:chat_talk/components/rounded_button.dart';
import 'package:chat_talk/screens/login_screen.dart';
import 'package:chat_talk/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String route = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController? controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1),
        // upperBound: 100,
        vsync: this,
    );
    
    // animation = CurvedAnimation(parent: controller!, curve: Curves.ease);

    animation = ColorTween(
      begin: Colors.black,
      end: Colors.white
    ).animate(controller!); 

    // controller!.reverse(from: 1);
    controller!.forward();

    // animation.addStatusListener((status){
    //   if(status == AnimationStatus.completed){
    //     controller!.reverse(from: 1);
    //   } else if(status == AnimationStatus.dismissed){
    //     controller!.forward();
    //   };
    // });
    controller!.addListener((){
      setState(() {});
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller!.value * 80,
                    // height: 60,
                  ),

                ),
                SizedBox(width: 10,),
                DefaultTextStyle(
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Chat',
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.greenAccent,
                  ),
                ),
                DefaultTextStyle(
                  child: AnimatedTextKit(
                    totalRepeatCount: 2,
                    animatedTexts: [
                      WavyAnimatedText('Talk',),
                    ],
                    // isRepeatingAnimation: true,
                  ),
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    color: Colors.yellow[600],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                btnText: 'Log in',
                btnColor: Colors.greenAccent.shade200,
                onPressed: (){
                  Navigator.pushNamed(context, LoginScreen.route);
                }
            ),
            RoundedButton(
              btnText: 'Register',
              btnColor: Colors.yellow.shade600,
              onPressed: () {
              //Go to registration screen.
              Navigator.pushNamed(context, RegistrationScreen.route);
            },),
          ],
        ),
      ),
    );
  }
}