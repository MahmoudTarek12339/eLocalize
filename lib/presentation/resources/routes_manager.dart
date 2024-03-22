import 'package:elocalize/presentation/addBook/view/add_book_view.dart';
import 'package:elocalize/presentation/books/view/books_view.dart';
import 'package:elocalize/presentation/main/main_screen.dart';
import 'package:elocalize/presentation/search/view/search_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String mainRoute = "/";
  static const String booksRoute = "/books";
  static const String searchRoute = "/search";
  static const String addBookRoute = "/addBook";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.booksRoute:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        int field = arguments['field'] as int;

        return MaterialPageRoute(builder: (_) => BooksView(field));
      case Routes.addBookRoute:
        return MaterialPageRoute(builder: (_) => const AddBookView());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => SearchView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No Route Found'),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
