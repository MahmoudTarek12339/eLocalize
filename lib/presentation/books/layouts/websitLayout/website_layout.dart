import 'package:elocalize/domain/model/book_model.dart';
import 'package:elocalize/presentation/books/widgets/book_details_widget.dart';
import 'package:elocalize/presentation/books/widgets/books_widget.dart';
import 'package:elocalize/presentation/books/widgets/page_switch_arrows_widget.dart';
import 'package:flutter/material.dart';

class BooksWebLayout extends StatelessWidget {
  final int index;
  final double value;
  final PageController _controller;
  final BookModel book;

  const BooksWebLayout(this.index, this.value, this._controller, this.book,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 15,
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //book author and description
            Expanded(child: BookDetailsWidget(index, book)),
            const SizedBox(
              width: 5,
            ),
            //book image and title
            Expanded(
                child: BooksWidget(
              index,
              value,
              book.title,
            )),
          ]),
        ),
        //arrows to turn right and left on website
        PageSwitchArrowsWidget(_controller, book.field)
      ],
    );
  }
}
