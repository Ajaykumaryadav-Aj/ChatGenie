// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

String APPNAME = 'Chat Genie';
String APIKEY = "AIzaSyAqtgYQGVHDAfQWILDH7TP6O5au79kCCwU";
String BaseURL =
    "https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$APIKEY";

class APIs {
  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(res.body);

      //
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }
}
