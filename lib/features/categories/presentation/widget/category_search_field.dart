import 'package:flutter/material.dart';

class CategorySearchField extends StatefulWidget {
  const CategorySearchField({super.key});

  @override
  State<CategorySearchField> createState() => _CategorySearchFieldState();
}

class _CategorySearchFieldState extends State<CategorySearchField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 50,
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by name',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
