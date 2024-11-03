import 'package:amazfront/features/categories/presentation/screen/category_screen.dart';
import 'package:amazfront/features/home/presentation/screens/home_screen.dart';
import 'package:amazfront/features/sales/presentation/screens/sales_screen.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    AmazFrontHomeScreen.routeName: (context) => const AmazFrontHomeScreen(),
    CategoryScreen.routeName: (context) => const CategoryScreen(),
    SalesScreen.routeName: (context) => const SalesScreen(),
  };
}
