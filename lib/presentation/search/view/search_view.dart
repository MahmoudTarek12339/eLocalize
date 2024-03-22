import 'package:elocalize/presentation/common/common_widgets/hero_widget.dart';
import 'package:elocalize/presentation/resources/color_manager.dart';
import 'package:elocalize/presentation/search/controller/search_controller.dart';
import 'package:elocalize/presentation/search/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        title: Consumer<SearchProvider>(
          builder: (context, searchProvider, _) {
            return HeroWidget(
              'Search Book',
              TextFormField(
                autofocus: true,
                controller: _queryController,
                onChanged: (value) {
                  searchProvider.searchBooks(_queryController.text.toString());
                },
                decoration: InputDecoration(
                  hintText: 'Search Book',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _queryController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      body: SizedBox.expand(
        child: Consumer<SearchProvider>(
          builder: (context, searchProvider, _) {
            if (searchProvider.searchResults.isNotEmpty) {
              return Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SearchItem(
                            searchProvider.searchResults[index].title,
                            searchProvider.searchResults[index].field,
                            _queryController);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                            height: 2,
                            width: double.infinity,
                            color: ColorManager.lightGrey);
                      },
                      itemCount: searchProvider.searchResults.length));
            } else {
              return const Center(
                child: Text(
                  "No Result Found",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
