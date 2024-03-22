import 'package:elocalize/presentation/main/widgets/books_grid_widget.dart';
import 'package:elocalize/presentation/main/widgets/shelf_widget.dart';
import 'package:flutter/material.dart';

class BooksShelfWidget extends StatelessWidget {
  final int position;
  const BooksShelfWidget(this.position,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BooksGridWidget(position),
        const ShelfWidget(),
      ],
    );
  }
}
