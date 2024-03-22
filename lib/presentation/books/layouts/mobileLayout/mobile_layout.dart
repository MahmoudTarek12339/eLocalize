import 'package:elocalize/domain/model/book_model.dart';
import 'package:elocalize/presentation/books/widgets/book_details_widget.dart';
import 'package:elocalize/presentation/books/widgets/books_widget.dart';
import 'package:flutter/material.dart';

class BooksMobileLayout extends StatelessWidget {
  final int index;
  final double value;
  final BookModel book;

  const BooksMobileLayout(this.index, this.value, this.book, {super.key});

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
            constraints: BoxConstraints(maxWidth: h * 0.7),
            child: AspectRatio(
              aspectRatio: 0.8,
              //book image and title
              child: BooksWidget(index, value, book.title),
            ),
          ),

          //book author and description
          //Intrinsic used to avoid scroll problem
          IntrinsicHeight(child: BookDetailsWidget(index, book)),
        ]),
      ),
    );
  }
}
