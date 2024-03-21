import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final TextEditingController _queryController;

  const SearchItem(this.title, this._queryController, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        /*Navigator.pushNamed(context, Routes.recipesResults,
              arguments: {'query':title});*/
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
