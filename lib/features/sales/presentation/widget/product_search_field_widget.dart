import 'package:amazfront/features/sales/helpers/filter_type_helper.dart';
import 'package:flutter/material.dart';

class ProductSearchFieldWidget extends StatelessWidget {
  const ProductSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 50,
          width: 250,
          child: TextField(
            onChanged: (value) {},
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
          onPressed: () {
            showFilterOptionsSelectionDialog(
              context: context,
              title: 'Choose filter type',
            );
          },
          icon: const Icon(
            Icons.filter_alt_outlined,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
