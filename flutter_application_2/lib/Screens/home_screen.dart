import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget{
  final double vtm;
  const Homescreen(this.vtm,{Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen>{

  final number1 = TextEditingController();
  final number2 = TextEditingController();

  double res = 0;

  void setDefaultValues(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('percent', value);

  }

  Future<double?> getDefaultValues() async {
      final prefs = await SharedPreferences.getInstance();
      final double percent = prefs.getDouble('percent')??widget.vtm;

      return percent;

  }

  @override
  Widget build(BuildContext context) {
    getDefaultValues().then((value) =>{
      number2.text = value.toString()
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(title: const Text("calculation"), elevation: 0, backgroundColor:  Color.fromARGB(255, 143, 54, 244)),
      drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('home'),
          onTap: () {
            
          },
        ),
        ListTile(
          leading: const Icon(Icons.build),
          title: const Text('configuration'),
          onTap: () {
            final route = MaterialPageRoute(builder: (context) => const SecondScreen());
            Navigator.push(context, route);
          },
        ),
      ],
    ),
  ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: number1,
            decoration: InputDecoration(
              labelText: 'amont',
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          ),
          keyboardType: TextInputType.number,
        ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: number2,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              labelText: 'percent',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          child: Center(
            child: Text('tip to pay',
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
              res = (double.parse(number1.text) * double.parse(number2.text)) / 100;
              setDefaultValues(double.parse(number2.text));
              showDialog(
                context: context, 
                builder: (context) {
                  return AlertDialog(
                    title: const Text("suma"),
                    content: Text("el resultado es $res"),
                  );
                }
                );
            }, 
            child: const Text("calculate")
            ),
          ),
          )
      ],
    )
    );
  }

}