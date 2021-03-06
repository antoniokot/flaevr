import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoadingPage(),
    );
  }
}
