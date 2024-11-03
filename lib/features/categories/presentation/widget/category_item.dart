import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'name',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
