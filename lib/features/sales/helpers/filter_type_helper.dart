import 'package:flutter/material.dart';

void showFilterOptionsSelectionDialog({
  required BuildContext context,
  required String title,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String _defaultValue = 'name';
      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('name'),
              leading: Radio(
                value: 'name',
                groupValue: _defaultValue,
                onChanged: (String? value) {
                  //handle changed stated
                  Navigator.of(context).pop();
                },
              ),
            ),
            ListTile(
              title: const Text('category'),
              leading: Radio(
                value: 'category',
                groupValue: _defaultValue,
                onChanged: (String? value) {
                  //handle changed stated
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
