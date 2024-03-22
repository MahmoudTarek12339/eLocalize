import 'package:elocalize/data/date_source/database_helper.dart';
import 'package:elocalize/domain/model/book_model.dart';
import 'package:flutter/material.dart';

class BooksProvider with ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<String> booksImages = [
    'https://i.pinimg.com/564x/f2/30/19/f230197db286a164fa8aa30ada7d71b9.jpg',
    'https://i.pinimg.com/564x/a8/fa/c7/a8fac7d8c07e5550cd3e3e5b90a8ffbb.jpg',
    'https://i.pinimg.com/564x/e2/35/cf/e235cfda49e35ef1e69442ee09ebf0d9.jpg',
    'https://i.pinimg.com/564x/60/86/09/608609cb613363a4bec0992fd87c1f9f.jpg',
    'https://i.pinimg.com/564x/0d/0c/5b/0d0c5bb7b5c93d70cb2196c9e072c90f.jpg',
    'https://i.pinimg.com/564x/18/af/7c/18af7c3fcadc1e851d39708fa8038c64.jpg',
    'https://i.pinimg.com/564x/98/67/2c/98672c012e6380beef2745d3de94dbc6.jpg',
    'https://i.pinimg.com/564x/2a/04/ae/2a04ae4983816379ebb63440e9e55744.jpg',
    'https://i.pinimg.com/564x/25/d5/a9/25d5a95e7c4978c40c7ed763ebf1274f.jpg',
    'https://i.pinimg.com/564x/e6/1d/26/e61d263856dd04d7676135e2fe975291.jpg',
    'https://i.pinimg.com/564x/68/df/a7/68dfa730f63a55c51159b427ef48e5fc.jpg',
    'https://i.pinimg.com/564x/8b/ae/1a/8bae1a37c088f06ce19b89f10a5b0707.jpg',
    'https://i.pinimg.com/564x/98/0e/dc/980edc0d66aa78733f585082aec28c76.jpg',
    'https://i.pinimg.com/564x/bc/be/e6/bcbee64cb478a5dcf676001b8d0bc204.jpg',
    'https://i.pinimg.com/564x/bc/98/6c/bc986c22d09662d26d5fe228c4c57e59.jpg',
    'https://i.pinimg.com/564x/07/f0/12/07f012224bc672114906d0f7df537cdf.jpg',
  ];
  List<BookModel> _books = [];
  List<BookModel> fieldBooks = [];

  List<BookModel> get books => _books;

  List<BookModel> getFieldBooks(field) =>
      _books.where((book) => book.field == field).toList();

  Future<void> getBooks() async {
    _books = await _databaseHelper.getBooks();
    notifyListeners();
  }

  // Method to add a new book to the database
  Future<void> addBook(BookModel book) async {
    await _databaseHelper.addBook(book);
    await getBooks(); // Refresh the list after adding
  }

  // Method to remove a book from the database
  Future<void> removeBook(int id) async {
    await _databaseHelper.removeBook(id);
    await getBooks(); // Refresh the list after removal
  }
}
