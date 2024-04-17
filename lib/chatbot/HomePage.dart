import 'package:chat_genie/chatbot/BardAIController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    BardAIController controller = Get.put(BardAIController());
    TextEditingController textField = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff2f1f9),
        appBar: AppBar(
          centerTitle: true,
          // leading: SvgPicture.asset(
          //   "assets/bard_logo.svg",
          //   width: 10,
          // ),
          title: const Text(
            "Chat Genie",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          backgroundColor: Colors.white,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         controller.sendPrompt("Hello what can you do for me ");
          //       },
          //       icon: const Icon(Icons.security))
          // ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       padding:
                    //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child:
                    //           const Text("Welcome to flutter hero ask some thing  ❤️ "),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 15),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       padding:
                    //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: const Text(
                    //           "😍 How can i be a best software developer in just"),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 15),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       padding:
                    //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       // child: const Text("Flutter Getx Full video💡 "),
                    //     ),
                    //   ],
                    // ),
                    Obx(() => Column(
                          children: controller.historyList
                              .map(
                                (e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(e.system == "user" ? "👨‍💻" : "🤖"),
                                      const SizedBox(width: 10),
                                      Flexible(child: Text(e.message)),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ))
                  ],
                )),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 60,
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        controller: textField,
                        decoration: const InputDecoration(
                            hintText: "You can ask what you want",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : IconButton(
                              onPressed: () {
                                if (textField.text != "") {
                                  controller.sendPrompt(textField.text);
                                  textField.clear();
                                }
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              )),
                    ),
                    const SizedBox(width: 10)
                  ]),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
