// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class VoiceHelper {
  final dbRef = FirebaseDatabase.instance.ref();

  /// ใส่ API Key ที่สร้างจาก Google AI Studio เท่านั้น
  final String geminiApiKey = "AIzaSyDCf85x4g1R_ISKaRtFWw0rs9mtukd9JtY";

  Future<String> detectLanguage(String text) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1/models/gemini-2.5-pro:generateContent?key=$geminiApiKey",
    );

    final body = {
      "contents": [
        {
          "parts": [
            {
              "text":
                  "Detect the language of this text and return only 'th' if Thai or 'en' if English: $text",
            },
          ],
        },
      ],
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["candidates"] != null &&
            data["candidates"].isNotEmpty &&
            data["candidates"][0]["content"] != null) {
          final result = data["candidates"][0]["content"]["parts"][0]["text"]
              .toString()
              .trim();
          return result;
        } else {
          return "unknown";
        }
      } else {
        return "unknown";
      }
    } catch (_) {
      return "unknown";
    }
  }

  void startListening(Function(String, bool) onResult) {
    final recognition = js.context['webkitSpeechRecognition'];
    if (recognition == null) {
      onResult("❌ Browser นี้ไม่รองรับ Speech API", false);
      return;
    }

    final recognitionObj = js.JsObject(recognition);
    recognitionObj['lang'] = "th-TH";
    recognitionObj['continuous'] = false;
    recognitionObj['interimResults'] = false;

    recognitionObj.callMethod('addEventListener', [
      'result',
      (e) async {
        final event = js.JsObject.fromBrowserObject(e);
        final results = event['results'];
        final firstResult = js.JsObject.fromBrowserObject(results[0]);
        final transcript = firstResult[0]['transcript'];

        final text = transcript.toString();
        onResult(text, true);

        final lang = await detectLanguage(text);

        if (lang == "th") {
          if (text.contains("เปิดไฟ")) {
            dbRef.child("devices/led").set(true);
          } else if (text.contains("ปิดไฟ")) {
            dbRef.child("devices/led").set(false);
          }
        } else if (lang == "en") {
          if (text.toLowerCase().contains("turn on light")) {
            dbRef.child("devices/led").set(true);
          } else if (text.toLowerCase().contains("turn off light")) {
            dbRef.child("devices/led").set(false);
          }
        }

        // Always save last command
        dbRef.child("voice/command").set(text);
      },
    ]);

    recognitionObj.callMethod('start');
  }

  /// 🛑 หยุดฟังเสียง
  void stopListening() {
    // Web API จะ stop เองเมื่อ end
  }
}
