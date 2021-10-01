import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({Key? key}) : super(key: key);

  @override
  _NavigationDialogState createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.color,
      appBar: AppBar(
        title: Text('Navigation dialogue'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Change Color'),
          onPressed: () {
            _showcolorDialogue(context);
          },
        ),
      ),
    );
  }

  _updateColor(BuildContext context, Color color) {
    this.color = color;
    Navigator.pop(context, color);
  }

  void _showcolorDialogue(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return AlertDialog(
            title: Text('important message'),
            content: Text('choose the following color ?'),
            actions: [
              TextButton(
                  onPressed: () {
                    this._updateColor(context, Colors.red);
                  },
                  child: Text('red')),
              TextButton(
                  onPressed: () {
                    this._updateColor(context, Colors.yellow);
                  },
                  child: Text('yellow')),
              TextButton(
                  onPressed: () {
                    this._updateColor(context, Colors.green);
                  },
                  child: Text('green'))
            ],
          );
        });
    setState(() {});
  }
}
