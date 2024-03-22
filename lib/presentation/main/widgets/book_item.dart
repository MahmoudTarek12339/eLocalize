import 'package:elocalize/presentation/main/controller/main_controller.dart';
import 'package:elocalize/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BookItem extends StatelessWidget {
  final int index;
  final int position;

  const BookItem(this.index, this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final String image = context.read<BooksProvider>().booksImages[position];
    return Padding(
      padding: index > 0
          ? EdgeInsets.only(left: w * 0.05)
          : EdgeInsets.only(left: w * 0.02),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.booksRoute,
              arguments: {'field': position});
        },
        child: SizedBox(
          width: w * 0.2,
          height: h * 0.15,
          child: Card(
            margin: const EdgeInsets.only(top: 15),
            color: Colors.white,
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                loadingBuilder: (context, widget, progress) {
                  if (progress == null) return widget;
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.black));
                },
                errorBuilder: (context, object, _) {
                  return SvgPicture.asset(
                    'assets/books/book1.svg',
                    fit: BoxFit.cover,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
