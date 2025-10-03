import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:firebase_database/firebase_database.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceHelper {
  final dbRef = FirebaseDatabase.instance.ref();
  final stt.SpeechToText _speech = stt.SpeechToText();
  String CurrectLang = "th-TH";

  void SetLang(String Lang){
    CurrectLang = Lang;
  }

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
        localeId: CurrectLang,
        onResult: (val) {
          final text = val.recognizedWords;
          onResult(text, true);

          if (text.contains("เปิดไฟ")) {
            dbRef.child("devices/led").set(true);
          } else if (text.contains("ปิดไฟ")) {
            dbRef.child("devices/led").set(false);
          }
          dbRef.child("voice/command").set(text);
        },
      );
    } else {
      onResult("❌ เปิดไมค์ไม่ได้", false);
    }
  }

  void stopListening() {
    _speech.stop();
  }
}
