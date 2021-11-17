import 'package:flutter/material.dart';
import 'package:myapp/facebook_ui/config/palette.dart';
import 'package:myapp/facebook_ui/screens/screens.dart';


// the entry point to the facebook ui
class Facebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Palette.scaffold),
      home: NavigationScreen(),  //the 
    );
  }
}
