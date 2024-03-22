import 'package:elocalize/domain/model/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  final int index;
  final BookModel book;

  const BookDetailsWidget(this.index, this.book, {super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 6,
            ),
            Text(
              'By ${book.author}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: Text(
                book.description,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
          ]),
    );
  }
}
