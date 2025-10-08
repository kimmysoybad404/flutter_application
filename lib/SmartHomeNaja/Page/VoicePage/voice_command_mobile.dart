import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class VoiceHelper {
  final dbRef = FirebaseDatabase.instance.ref();
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts();

  /// ใส่ API Key ของ Gemini
  final String geminiApiKey = "AIzaSyDCf85x4g1R_ISKaRtFWw0rs9mtukd9JtY";

  Future<bool> initPermission() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      print("🎤 Microphone allowed");
      return true;
    } else {
      print("❌ Microphone denied");
      return false;
    }
  }

  /// ตรวจจับภาษา (TH / EN)
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
                  "You are a language detector. If the text is Thai return exactly: th. If the text is English return exactly: en. Do not add anything else.\n\nText: $text",
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
        final raw =
            data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"]
                ?.toString()
                .trim()
                .toLowerCase() ??
            "unknown";

        if (raw.contains("th")) return "th";
        if (raw.contains("en")) return "en";
        return "unknown";
      } else {
        print("❌ API Error: ${response.body}");
        return "unknown";
      }
    } catch (e) {
      print("❌ Detect error: $e");
      return "unknown";
    }
  }

  Future<String> getLatestTemperature() async {
    try {
      final snapshot = await dbRef.child("weather").limitToLast(1).get();

      if (snapshot.exists) {
        // snapshot.value = { "2025-10-02": {...} }
        final data = snapshot.value as Map;
        final lastDateKey = data.keys.last; // วันที่ล่าสุด
        final lastDateMap = data[lastDateKey] as Map;

        final lastTimeKey = lastDateMap.keys.last; // เวลาล่าสุด
        final latestTemp = lastDateMap[lastTimeKey];

        return latestTemp.toString();
      } else {
        return "ไม่พบข้อมูลอุณหภูมิ";
      }
    } catch (e) {
      print("❌ Temp error: $e");
      return "Error";
    }
  }

  /// fallback ถ้า Gemini ตอบ unknown
  String fallbackDetect(String text, String lang) {
    if (lang == "unknown") {
      if (RegExp(r'[ก-ฮ]').hasMatch(text)) {
        return "th";
      }
      if (RegExp(r'[a-zA-Z]').hasMatch(text)) {
        return "en";
      }
    }
    return lang;
  }

  /// 🎤 เริ่มฟังเสียง
  Future<void> startListening(Function(String, bool) onResult) async {
    bool micOK = await initPermission();
    if (!micOK) {
      onResult("❌ ยังไม่ได้อนุญาตไมโครโฟน", false);
      return;
    }

    bool available = await _speech.initialize(
      onStatus: (val) => print("Status: $val"),
      onError: (val) => print("Error: $val"),
    );

    if (available) {
      _speech.listen(
        localeId: "th-TH", // ฟังทั้งไทยและอังกฤษ
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 5),
        partialResults: true,
        onResult: (val) async {
          final text = val.recognizedWords.trim();
          if (text.isEmpty) return;

          onResult(text, true);
          print("🎤 Input: $text");

          // ตรวจภาษา
          final rawLang = await detectLanguage(text);
          final lang = fallbackDetect(text, rawLang);

          // 🔦 Command ไทย
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
            } else if (text.contains("อุณหภูมิ")) {
              final temp = await getLatestTemperature();
              onResult("$temp °C", true);
              final msg = "$temp °C";
              dbRef.child("voice/response").set(msg);

              await _tts.setLanguage("th-TH");
              await _tts.speak("ตอนนี้อุณหภูมิ $temp องศาเซลเซียส");
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
            } else if (text.toLowerCase().contains("temperature")) {
              final temp = await getLatestTemperature();
              onResult("$temp °C", true);
              final msg = "$temp °C";
              dbRef.child("voice/response").set(msg);

              await _tts.setLanguage("en-US");
              await _tts.speak(
                "The current temperature is $temp degrees Celsius",
              );
            }
          }

          // 📌 บันทึกลง Firebase
          dbRef.child("voice/command").set(text);
          dbRef.child("voice/history").push().set({"text": text, "lang": lang});
        },
      );
    } else {
      onResult("❌ Microphone not available", false);
    }
  }

  void stopListening() {
    _speech.stop();
  }
}
