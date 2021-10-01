import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String? result;
  // Completer? completer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back to future'),
      ),
      body: Column(
        children: [
          Spacer(),
          ElevatedButton(
              onPressed: () async {
                // this.getData().then((value) {
                //   this.result = value.body.toString();
                //   setState(() {});
                // }).catchError((_) {
                //   result = 'an error occured';
                //   setState(() {});
                // });
                // compute();
                // returnFg();
                // returnError().then((value) {
                //   setState(() {
                //     result = 'success';
                //   });
                // }).catchError((onError) {
                //   setState(() {
                //     result = onError;
                //   });
                // }).whenComplete(() => print('operation complete !'));
                try {
                  await returnError();
                  setState(() {
                    result = 'success';
                  });
                } catch (error) {
                  setState(() {
                    result = error.toString();
                  });
                } finally {
                  print('opearation completed');
                }
              },
              child: Text('GO!')),
          Spacer(),
          Text(this.result.toString()),
          Spacer(),
          CircularProgressIndicator(),
          Spacer()
        ],
      ),
    );
  }

  // Future<int>? getNumber() {
  //   completer = Completer<int>();
  //   this.calculate();
  //   return completer.future;
  // }

  Future<int> oneSecwait() async {
    await Future.delayed(Duration(seconds: 3));
    return 1;
  }

  Future<int> twoSecwait() async {
    await Future.delayed(Duration(seconds: 3));
    return 2;
  }

  Future<int> threeSecwait() async {
    await Future.delayed(Duration(seconds: 3));
    return 3;
  }

  compute() async {
    int total = 0;
    total += await this.oneSecwait();
    print('first await executed');
    total += await this.twoSecwait();
    print('second await executed');
    total += await this.threeSecwait();
    this.result = total.toString();
    setState(() {});
  }

  Future<Response> getData() async {
    print('get data called');
    final String authority = 'www.googleapis.com';
    final String path = '/books/v1/volumes/junbDAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  // void calculate() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   completer!.complete(42);
  // }

  void returnFg() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(this.oneSecwait());
    futureGroup.add(this.twoSecwait());
    futureGroup.add(this.threeSecwait());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      value.forEach((element) {
        total += element;
      });
      setState(() {
        result = total.toString();
      });
    });
  }

  Future returnError() {
    throw ('this is some error');
  }
}
