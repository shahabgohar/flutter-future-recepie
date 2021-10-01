import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({Key? key}) : super(key: key);

  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mavigation Secong Screen'),
      ),
      body: Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.red);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  child: Text('Red Color')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.yellow);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow)),
                  child: Text('yellow Color')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.green);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  child: Text('green Color')),
            ],
          ),
        ),
      ),
    );
  }
}
