import 'package:flutter/material.dart';
import 'package:my_notepad/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan[700],
        cardColor: Colors.orange[300],
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.orange[300]),
      ),
      home:const Home(),
    );
  }
}

//lets build apk file....
//flutter build apk --build-name=1.0.1 --build-number=1