import 'package:amazfront/features/categories/presentation/widget/category_button_widget.dart';
import 'package:amazfront/features/sales/presentation/widget/sales_button_widget.dart';
import 'package:flutter/material.dart';

class AmazFrontHomeScreen extends StatelessWidget {
  const AmazFrontHomeScreen({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AMAZ-FRONT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.blue,
      ),
      primary: true,
      body: const SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryButtonWidget(),
            SizedBox(
              height: 20,
            ),
            SalesButtonWidget(),
          ],
        ),
      ),
    );
  }
}
