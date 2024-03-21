import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xFFF44336),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.of(context).pop();
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
                                value: value, child: Text('${value + 1}')))
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
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
                        // Submit data
                        String title = _titleController.text;
                        String author = _authorController.text;
                        String description = _descriptionController.text;
                        print(
                            'Title: $title, Author: $author, Description: $description');
                        // Reset form
                        _formKey.currentState!.reset();
                        _selectedFieldNumber=1;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD22120),
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
}
