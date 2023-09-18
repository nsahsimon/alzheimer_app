
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class AIService {

  Future<Map<String, dynamic>?> processText(String textInput) async {
    debugPrint("Generating result JSON");
    final apiEndpoint = "https://api.openai.com/v1/chat/completions";//'https://api.openai.com/v1/chat/completions';
    final apiKey = "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"; //'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'; // Replace with your OpenAI API key

    textInput = textInput.replaceAll("  ", " ");
    textInput = textInput.replaceAll("   ", " ");
    textInput = textInput.replaceAll("    ", " ");
    textInput = textInput.replaceAll("     ", " ");
    textInput = textInput.replaceAll("      ", " ");
    textInput = textInput.replaceAll("       ", " ");
    final int wordCount = textInput.split(" ").length;

    final prompt = '''
        Text input: $textInput 
    ''';

    debugPrint("Prompt: $prompt");

    final response = await http.post(
      Uri.parse(apiEndpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model':"gpt-3.5-turbo",
        'messages': [
          {'role': 'system', 'content': '''You are a language expert and your job is to analyze and identify errors within text such as
          repeated words, misspelled words, phrases etc
          '''},
          {'role': 'user', 'content': '''
          Consider the body of text: "$textInput"
          Questions:
          Based on the text above correctly extract all the repeated words, misspelled words and all phrases from the text. Please  return only a  correctly formatted JSON string as your output like this.
          {
             repeated_words : ["word 1", "word 2", .....],
             misspelled_words : ["word 1", "word 2", .....],
             phrases : ["phrase 1", "phrase 2", .....],
          }
          '''}
        ],
      }),
    );

    if (response.statusCode == 200) {
      final responseData = response.body;
      final dynamic jsonResponse = json.decode(responseData);
      final responseContent = jsonResponse['choices'][0]['message']['content'];
      try {
        Map<String, dynamic> result = await json.decode(responseContent);
        debugPrint("Successfully result using chatgpt");

        debugPrint("Result1: $result");
        int effectiveWordCount = wordCount - result['repeated_words'].length as int;
        debugPrint("Word count: $wordCount, Effective word count: $effectiveWordCount");
        for(var key in result.keys) {
          result[key] = result[key].length * 100 / effectiveWordCount;
        }
        debugPrint("Result2: $result");

        return result;
      }catch(e) {
        debugPrint("$e");
        return null;
      }

    } else {
      debugPrint('Failed to get response from OpenAI API.');
      debugPrint('Response code: ${response.statusCode}, Response body: ${response.body}');
      return null;
    }
  }


}

