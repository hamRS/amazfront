import 'package:amazfront/bootstrap.dart';
import 'package:amazfront/core/database_helper.dart';
import 'package:amazfront/core/routes/navigation_helper.dart';
import 'package:amazfront/features/categories/data/datasource/categories_local_datasource.dart';
import 'package:amazfront/features/categories/data/repository/categories_repository_impl.dart';
import 'package:amazfront/features/categories/domain/repository/categories_repository.dart';
import 'package:amazfront/features/categories/presentation/bloc/categories_list/categories_bloc.dart';
import 'package:amazfront/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
