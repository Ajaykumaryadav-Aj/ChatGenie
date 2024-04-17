import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_genie/main.dart';
import 'package:chat_genie/screens/cus_landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //wait for some time on splash & then move to next screen
    Future.delayed(const Duration(seconds: 5), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (_) => Pref.showOnboarding
      //         ? const OnboardingScreen()
      //         : const HomeScreen()));
      Get.off(() => const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing device size
    var mq = MediaQuery.sizeOf(context);

    return Scaffold(
      //body
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            //for adding some space
            const Spacer(flex: 1),

            //logo
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child:
                    Image.asset('assets/images/logo.png', width: mq.width * .4),
              ),
            ),
            const Spacer(flex: 1),
            AnimatedTextKit(
              isRepeatingAnimation: true,
              animatedTexts: [
                ColorizeAnimatedText('Welcome to ',
                    colors: [Colors.black, Colors.transparent],
                    textStyle: const TextStyle(
                      fontSize: 20,
                    )),
                ColorizeAnimatedText(' Chat Genie',
                    colors: [Colors.greenAccent, Colors.blue],
                    textStyle: const TextStyle(fontSize: 30)),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 200),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),

            //for adding some space
            const Spacer(),

            //lottie loading
            const CustomLoading(),

            //for adding some space
            const Spacer(),
          ],
        ),
      ),
    );
  }
}