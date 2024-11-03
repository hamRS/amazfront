import 'package:amazfront/features/categories/presentation/widget/category_item.dart';
import 'package:amazfront/features/categories/presentation/widget/category_search_field.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Categories',
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
      body: const Padding(
        padding: EdgeInsets.all(
          20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CategorySearchField(),
            SizedBox(
              height: 20,
            ),
            _CategoryListSection(),
          ],
        ),
      ),
    );
  }
}

class _CategoryListSection extends StatelessWidget {
  const _CategoryListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          CategoryItemWidget(),
          CategoryItemWidget(),
        ],
      ),
    );
  }
}
