import 'package:elocalize/presentation/books/widgets/book_animation_widget.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text('ELocalize'),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cloud_download_outlined,
                      color: Colors.grey)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.book_outlined, color: Colors.grey))
            ]),
        body: const BookAnimationWidget());
  }
}
/*_opedDetailsPage(int index) {
    //start image scale animation
    _animationController.forward();

    //navigate to next page with fade animation
    Navigator.of(context)
        .push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
              opacity: animation,
              child: DetailsScreen(
                book: books[index],
              ));
        }))
        .then((value) => _animationController.reset()); //here we reset image scale again

  }*/
