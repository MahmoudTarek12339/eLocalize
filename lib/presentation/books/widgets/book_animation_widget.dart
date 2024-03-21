import 'package:elocalize/presentation/books/layouts/mobileLayout/mobile_layout.dart';
import 'package:elocalize/presentation/books/layouts/websitLayout/website_layout.dart';
import 'package:flutter/material.dart';

class BookAnimationWidget extends StatefulWidget {
  const BookAnimationWidget({super.key});

  @override
  State<BookAnimationWidget> createState() => _BookAnimationWidgetState();
}

class _BookAnimationWidgetState extends State<BookAnimationWidget> {
  final _controller = PageController();

  final _notifier = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _notifier.value = _controller.page!;
    });
  }

  @override
  void dispose() {
    _notifier.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: _notifier,
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              PageView.builder(
                  controller: _controller,
                  itemCount: 3,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth < 800) {
                        return BooksMobileLayout(index, value);
                      } else {
                        return BooksWebLayout(index, value,_controller);
                      }
                    });
                  }),
            ],
          );
        });
  }

  _onPageChanged(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
    );
  }
}
