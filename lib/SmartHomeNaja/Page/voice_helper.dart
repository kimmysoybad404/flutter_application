// ✅ เลือก import ให้เองตาม platform ที่รันอยู่
export 'voice_command_mobile.dart'
    if (dart.library.js) 'voice_command_web.dart';
