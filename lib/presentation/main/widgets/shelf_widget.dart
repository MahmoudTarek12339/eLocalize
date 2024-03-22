import 'package:flutter/material.dart';

class ShelfWidget extends StatelessWidget {
  const ShelfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20.0,
      width: double.infinity,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.zero,
        color: Colors.brown,

        shadowColor: Colors.black,
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),*/
      ),
    );
  }
}
