import 'package:elocalize/domain/model/book_model.dart';
import 'package:elocalize/presentation/books/layouts/mobileLayout/mobile_layout.dart';
import 'package:elocalize/presentation/books/layouts/websitLayout/website_layout.dart';
import 'package:elocalize/presentation/main/controller/main_controller.dart';
import 'package:elocalize/presentation/resources/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookAnimationWidget extends StatefulWidget {
  final int field;

  const BookAnimationWidget(this.field, {super.key});

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
    List<BookModel> books =
        context.read<BooksProvider>().getFieldBooks(widget.field);
    return ValueListenableBuilder<double>(
        valueListenable: _notifier,
        builder: (context, value, child) {
          if (books.isEmpty) {
            return const Center(
              child: Text('No Books in This Field'),
            );
          }
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              PageView.builder(
                  controller: _controller,
                  itemCount: books.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth <
                          AppConstants.mobileBreakPoint) {
                        //mobile layout
                        return BooksMobileLayout(index, value, books[index]);
                      } else {
                        //tablet and website layout
                        return BooksWebLayout(
                            index, value, _controller, books[index]);
                      }
                    });
                  }),
            ],
          );
        });
  }

  //start page switch animation
  _onPageChanged(int page) {
    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
    );
  }
}
