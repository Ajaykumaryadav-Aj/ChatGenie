// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

String APPNAME = 'Chat Genie';
String APIKEY = "AIzaSyCb67KIUzhgbTL6mhBGJDJ_PeqPbYY4rwU";
String BaseURL =
    "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$APIKEY";

class APIs {
  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));
      // await get(Uri.parse( 'https://ai-image-generator-from-a-prompt-using-openai-api.p.rapidapi.com/image?q=$prompt'));

      final data = jsonDecode(res.body);

      //
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }
}
