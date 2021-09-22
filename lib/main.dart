import 'package:flutter/material.dart';
import 'pages/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flaevr",
      theme: ThemeData(
        primaryColor: Color(0xff3d3d4e),
        canvasColor: Colors.white,
        // Define the default font family.
        fontFamily: 'Lato',
      ),
      home: LoadingPage(),
    );
  }
}
