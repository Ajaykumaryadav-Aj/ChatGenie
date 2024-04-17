import 'package:chat_genie/chatbot/HomePage.dart';
import 'package:chat_genie/screens/image.dart';
import 'package:chat_genie/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGenie FLUTTER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(117, 68, 68, 68),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 37, 97, 127),
          centerTitle: true,
          title: const Text(
            'Chat Genie',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        drawer: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('About'), Text('Description')],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const ChatPage());
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 143, 110),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        LottieBuilder.asset(
                          'assets/lottie/ai_hand_waving.json',
                          width: 150,
                        ),
                        SizedBox(width: mq.width * 0.15),
                        const Text(
                          'AI ChatBot',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const ImageFeature());
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(206, 2, 73, 95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'AI Image Creator',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        LottieBuilder.asset(
                          'assets/lottie/ai_play.json',
                          width: 120,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
