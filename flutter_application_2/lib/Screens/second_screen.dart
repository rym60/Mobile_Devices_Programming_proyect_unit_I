import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget{
  const SecondScreen ({Key? key}) : super(key: key);


  @override
  State<SecondScreen> createState() => _ConfcreenState();
  }
  

  class _ConfcreenState extends State<SecondScreen>{

    final res = TextEditingController();
    double vtm = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: const Text("configuration"), elevation: 0, backgroundColor:  Color.fromARGB(255, 143, 54, 244)),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: res,
            decoration: InputDecoration(
              labelText: 'amont',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
          keyboardType: TextInputType.number,
        ),
          ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          child: 
          Center(
            child:
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 143, 54, 244))),
            onPressed: () {
              vtm = double.parse(res.text);
              final route = MaterialPageRoute(builder: (context) =>  Homescreen(vtm));
              Navigator.push(context, route);
            }, 
            child: const Text("change")
            ),
          ),
          )
      ]
      )
    );
  }

  }