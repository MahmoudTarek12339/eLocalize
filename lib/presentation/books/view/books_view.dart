import 'package:elocalize/presentation/books/widgets/book_animation_widget.dart';
import 'package:elocalize/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  final int field;

  const BooksView(this.field, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.darkRed,
          title: Text('Field ${field + 1}'),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BookAnimationWidget(field));
  }
}
