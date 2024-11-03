import 'package:amazfront/main.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.

  runApp(
    const AmazfrontApp(),
  );
}
