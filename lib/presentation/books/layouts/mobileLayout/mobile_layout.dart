import 'package:elocalize/presentation/books/widgets/book_details_widget.dart';
import 'package:elocalize/presentation/books/widgets/books_widget.dart';
import 'package:flutter/material.dart';

class BooksMobileLayout extends StatelessWidget {
  final int index;
  final double value;

  const BooksMobileLayout(this.index, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //here we added some constrains to keep image responsive for both tablet and mobile
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: h * 1.2),
            child: AspectRatio(
              aspectRatio: 1,
              child: BooksWidget(index, value),
            ),
          ),
          IntrinsicHeight(child: BookDetailsWidget(index)),
        ]),
      ),
    );
  }
}
