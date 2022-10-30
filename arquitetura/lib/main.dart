import 'package:arquitetura/view/principal.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arquitetura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PrincipalView(),
    );
  }
}