import 'package:flutter/material.dart';
import 'package:flutter_application/Learn/ChangeImage.dart';
import 'package:flutter_application/Learn/LW8/SingleChildScrollView.dart';
import 'package:flutter_application/Learn/LW8/SingleChildScrollView2.dart';
import 'package:flutter_application/Learn/LW8/Tab.dart';
import 'package:flutter_application/Learn/LW8/Tab2.dart';
import 'package:flutter_application/SmartHomeNaja/Main.dart';
import 'package:flutter_application/W7/Page1.dart' hide Page1;
import 'package:flutter_application/Test/Fishing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/W8/Ass1W8.dart';
import 'package:flutter_application/W8/Ass2W8.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Ass2W8());
  }
}
