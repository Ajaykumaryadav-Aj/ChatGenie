import 'dart:convert';
import 'dart:developer';

import 'package:chat_genie/apis/apis.dart';
import 'package:chat_genie/screens/chatbot/BardModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BardAIController extends GetxController {
  RxList historyList = RxList<BardModel>([
    BardModel(system: "user", message: "Hello,"),
    BardModel(system: "bard", message: "How can I help you today"),
  ]);

  RxBool isLoading = false.obs;

  void sendPrompt(String prompt) async {
    isLoading.value = true;

    // Add user message to chat history
    historyList.add(BardModel(system: "user", message: prompt));

    // Gemini API endpoint
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$APIKEY',
    );

    // Request body as expected by Gemini
    final body = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {"text": prompt}
          ]
        }
      ]
    };

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);
      log('Gemini API Response: ${jsonEncode(data)}');

      // Safely extract Gemini's reply
      final text = data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];

      if (text != null && text.isNotEmpty) {
        historyList.add(BardModel(system: "bard", message: text));
      } else {
        historyList.add(BardModel(
            system: "bard", message: "No response received from Gemini."));
        log("Gemini response was empty or malformed.");
      }
    } catch (e, st) {
      log('Gemini API error: $e\n$st');
      historyList.add(BardModel(
        system: "bard",
        message: "Error communicating with Gemini API.",
      ));
    } finally {
      isLoading.value = false;
    }
  }
}
