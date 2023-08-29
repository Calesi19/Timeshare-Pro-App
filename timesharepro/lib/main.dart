import 'dart:ui';
import 'package:flutter/material.dart';
import 'components/drawer.dart';
import 'pages/proposal_phone_view.dart';

void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProposalPage(),
    );
  }
}
