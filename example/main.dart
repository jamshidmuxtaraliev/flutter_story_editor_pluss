import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'example.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlutterStoryEditorExample(),
    );
  }
}
