import 'package:elocalize/presentation/main/widgets/book_item.dart';
import 'package:flutter/material.dart';

class BooksGridWidget extends StatelessWidget {
  final int position;

  const BooksGridWidget(this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * 0.15,
      child: ListView.builder(
        itemBuilder: (context, index) => BookItem(index,(index + position)),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
