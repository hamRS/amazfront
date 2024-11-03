import 'package:amazfront/features/sales/presentation/screens/sales_screen.dart';
import 'package:flutter/material.dart';

class SalesButtonWidget extends StatelessWidget {
  const SalesButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          SalesScreen.routeName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Column(
            children: [
              Icon(
                Icons.shop_2_outlined,
                color: Colors.white,
              ),
              Text(
                'Sales',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
