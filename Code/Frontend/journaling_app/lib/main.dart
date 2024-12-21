import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:journaling_app/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyANuppE64jsYKwdcpQMwsGPtukceFNjyDk",
        authDomain: "journaling-a50de.firebaseapp.com",
        projectId: "journaling-a50de",
        storageBucket: "journaling-a50de.firebasestorage.app",
        messagingSenderId: "515101869287",
        appId: "1:515101869287:web:e3c523dbaa68d477a0ce42",
        measurementId: "G-M7HNZZXGZJ"));
  }
  else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jounraling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
