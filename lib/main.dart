import 'package:chatting/home/home.dart';
import 'package:chatting/profile/editpeofile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB1BZx_wnbXTRG-Euq0P_UlOrXzEAAuFt8",
      appId: "1:643656729705:android:10ab93ba3d49b10aa10ef8",
      messagingSenderId: "643656729705",
      projectId: "chatting-35d29",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfilePage(),
    );
  }
}
