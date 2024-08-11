import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/movieDetailsScreen.dart';
import 'package:movie_app/screens/onboarding_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
     
      builder: (context)=>  MyApp())
    
    );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key:key);

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
       locale: DevicePreview.locale(context),
      theme:ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      home: HomeScreen(),
    );
  }
}