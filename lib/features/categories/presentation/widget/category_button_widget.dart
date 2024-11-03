import 'package:amazfront/features/categories/presentation/screen/category_screen.dart';
import 'package:flutter/material.dart';

class CategoryButtonWidget extends StatelessWidget {
  const CategoryButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryScreen.routeName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(
            10,
          ),
          child: Column(
            children: [
              Icon(
                Icons.category,
                color: Colors.white,
              ),
              Text(
                'Categories',
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
