import 'package:elocalize/data/date_source/database_helper.dart';
import 'package:elocalize/domain/model/book_model.dart';
import 'package:flutter/cupertino.dart';

class SearchProvider with ChangeNotifier{
  final DatabaseHelper databaseHelper = DatabaseHelper();
  List<BookModel> _searchResults = [];

  List<BookModel> get searchResults => _searchResults;

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = await databaseHelper.searchBooks(query);
    }
    notifyListeners();
  }
}