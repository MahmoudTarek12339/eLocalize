import 'package:elocalize/presentation/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageSwitchArrowsWidget extends StatelessWidget {
  final PageController _controller;
  final int field;

  const PageSwitchArrowsWidget(this._controller, this.field, {super.key});

  @override
  Widget build(BuildContext context) {
    final int length =
        context.read<BooksProvider>().getFieldBooks(field).length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //animate to previous book
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (_controller.page != 0) {
              _controller.previousPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
              );
            }
          },
        ),

        //animate to next book
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            if (_controller.page != length - 1) {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn);
            }
          },
        ),
      ],
    );
  }
}
