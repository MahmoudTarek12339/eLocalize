import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  final int index;
  const BookDetailsWidget(this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /*heroWidget(
              'tag',*/
          Text(
            'Flutter Project',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          SizedBox(height: 5.08),
          /*heroWidget(
            'tag2',*/
          Text(
            'By John Cina',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          )
        ]);
  }
}
