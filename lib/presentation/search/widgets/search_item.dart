import 'package:elocalize/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final int field;

  final TextEditingController _queryController;

  const SearchItem(this.title, this.field, this._queryController, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, Routes.booksRoute,
            arguments: {'field': field});
      },
      title: SubstringHighlight(
        text: title,
        term: _queryController.text,
        overflow: TextOverflow.ellipsis,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        textStyleHighlight: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
