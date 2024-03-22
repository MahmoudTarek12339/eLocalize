import 'package:elocalize/presentation/main/widgets/books_shelf_widget.dart';
import 'package:elocalize/presentation/main/widgets/home_search_widget.dart';
import 'package:elocalize/presentation/resources/color_manager.dart';
import 'package:elocalize/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              HomeSearchWidget(),
              BooksShelfWidget(0),
              BooksShelfWidget(4),
              BooksShelfWidget(8),
              BooksShelfWidget(12),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ColorManager.darkRed,
          onPressed: () {
            Navigator.pushNamed(context, Routes.addBookRoute);
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
