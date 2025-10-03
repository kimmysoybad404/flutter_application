// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';

class VoiceHelper {
  final dbRef = FirebaseDatabase.instance.ref();

  /// API Key จาก Google AI Studio
  final String geminiApiKey = "AIzaSyDCf85x4g1R_ISKaRtFWw0rs9mtukd9JtY";

  DateTime _lastApiCall = DateTime.now();

  /// ✅ Simple check ภาษา (Offline ไม่กิน quota)
  String simpleDetectLang(String text) {
    final thaiRegex = RegExp(r'[\u0E00-\u0E7F]');
    if (thaiRegex.hasMatch(text)) return "th";
    if (RegExp(r'[a-zA-Z]').hasMatch(text)) return "en";
    return "unknown";
  }

  /// ✅ ใช้ Gemini API ถ้าจำเป็น
  Future<String> detectLanguage(String text) async {
    // Debounce กัน spam
    if (DateTime.now().difference(_lastApiCall).inSeconds < 2) {
      return "unknown";
    }
    _lastApiCall = DateTime.now();

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
        }
      }
      return "unknown";
    } catch (_) {
      return "unknown";
    }
  }

  /// 🎤 Start listening
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

        // ✅ ใช้ regex ก่อน
        String lang = simpleDetectLang(text);

        // ถ้า regex ไม่มั่นใจ → fallback ไป Gemini
        if (lang == "unknown") {
          lang = await detectLanguage(text);
        }

        // --- Control IoT Devices ---
        if (lang == "th") {
          if (text.contains("เปิดไฟ")) {
            dbRef.child("devices/led").set(true);
          } else if (text.contains("ปิดไฟ")) {
            dbRef.child("devices/led").set(false);
          } else if (text.contains("เปิดพัดลม")) {
            dbRef.child("devices/fan").set(true);
          } else if (text.contains("ปิดพัดลม")) {
            dbRef.child("devices/fan").set(false);
          } else if (text.contains("เปิดแอร์")) {
            dbRef.child("devices/ac").set(true);
          } else if (text.contains("ปิดแอร์")) {
            dbRef.child("devices/ac").set(false);
          }
        } else if (lang == "en") {
          if (text.toLowerCase().contains("turn on light")) {
            dbRef.child("devices/led").set(true);
          } else if (text.toLowerCase().contains("turn off light")) {
            dbRef.child("devices/led").set(false);
          } else if (text.toLowerCase().contains("turn on fan")) {
            dbRef.child("devices/fan").set(true);
          } else if (text.toLowerCase().contains("turn off fan")) {
            dbRef.child("devices/fan").set(false);
          } else if (text.toLowerCase().contains("turn on air")) {
            dbRef.child("devices/ac").set(true);
          } else if (text.toLowerCase().contains("turn off air")) {
            dbRef.child("devices/ac").set(false);
          }
        }

        // ✅ Save command + history
        dbRef.child("voice/command").set(text);
        dbRef.child("voice/history").push().set({"text": text, "lang": lang});
      },
    ]);

    recognitionObj.callMethod('start');
  }

  /// 🛑 Stop listening
  void stopListening() {
    // Web API จะ stop เองเมื่อ end
  }
}
