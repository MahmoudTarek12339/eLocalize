import 'package:elocalize/domain/model/book_model.dart';
import 'package:elocalize/presentation/main/controller/main_controller.dart';
import 'package:elocalize/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({super.key});

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _authorController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  int _selectedFieldNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.darkRed,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Book',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //take book name
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                //take book author and field number
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _authorController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Author',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an author';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _selectedFieldNumber,
                        borderRadius: BorderRadius.circular(5),
                        alignment: AlignmentDirectional.center,
                        onChanged: (field) {
                          setState(() {
                            _selectedFieldNumber = field!;
                          });
                        },
                        items: List.generate(16, (index) => index + 1)
                            .map((value) => DropdownMenuItem(
                                value: value, child: Text('$value')))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                //take book description
                TextFormField(
                  controller: _descriptionController,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Description',
                  ),
                  maxLines: 15,
                  minLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter book description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 48),

                //submit button
                Container(
                  height: 50,
                  width: double.infinity,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addBook().then((value) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.darkRed,
                    ),
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _addBook() async {
    final bookProvider = Provider.of<BooksProvider>(context, listen: false);

    // Create a new BookModel object from the user input
    BookModel newBook = BookModel(
      _titleController.text,
      _authorController.text,
      _descriptionController.text.toString(),
      _selectedFieldNumber,
    );

    // add book to data base
    bookProvider.addBook(newBook);

    // Clear text field controllers after adding the book
    _titleController.clear();
    _authorController.clear();
    _descriptionController.clear();
    _selectedFieldNumber = 1;

    // Show snack bar to confirm book addition
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Book added successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
