import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/home_screen.dart';


void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  final double zero = 0;
  const myapp([Key? key]):super(key: key);

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homescreen(15),
  );
}
}