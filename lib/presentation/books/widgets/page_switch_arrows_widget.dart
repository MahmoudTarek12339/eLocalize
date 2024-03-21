import 'package:flutter/material.dart';

class PageSwitchArrowsWidget extends StatelessWidget {
  final PageController _controller;

  const PageSwitchArrowsWidget(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            if (_controller.page != 3 - 1) {
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
