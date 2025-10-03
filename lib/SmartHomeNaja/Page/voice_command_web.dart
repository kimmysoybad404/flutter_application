// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:firebase_database/firebase_database.dart';

class VoiceHelper {
  final dbRef = FirebaseDatabase.instance.ref();

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
      (e) {
        final event = js.JsObject.fromBrowserObject(e);
        final results = event['results'];
        final firstResult = js.JsObject.fromBrowserObject(results[0]);
        final transcript = firstResult[0]['transcript'];

        final text = transcript.toString();
        onResult(text, true);

        if (text.contains("เปิดไฟ")) {
          dbRef.child("devices/led").set(true);
        } else if (text.contains("ปิดไฟ")) {
          dbRef.child("devices/led").set(false);
        }
        dbRef.child("voice/command").set(text);
      },
    ]);

    recognitionObj.callMethod('start');
  }

  void stopListening() {
    // Web API จะ stop เองเมื่อ end
  }
}
