import 'package:amazfront/features/sales/presentation/widget/sales_product_card_widget.dart';
import 'package:flutter/material.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  static const String routeName = '/sales';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Shopping cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            SalesProductCardWidget(),
            SalesProductCardWidget(),
          ],
        ));
  }
}
