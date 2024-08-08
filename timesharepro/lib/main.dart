import 'package:flutter/material.dart';
import 'pages/proposal_phone_view.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timeshare Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProposalPage(),
    );
  }
}
