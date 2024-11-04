import 'package:amazfront/bootstrap.dart';
import 'package:amazfront/core/routes/navigation_helper.dart';
import 'package:amazfront/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  bootstrap();
}

class AmazfrontApp extends StatelessWidget {
  const AmazfrontApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmazFront',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: NavigationHelper.routes,
      home: const AmazFrontHomeScreen(),
    );
  }
}
