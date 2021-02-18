import 'package:Test01/core/di/get_it.dart';
import 'package:Test01/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'core/di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
