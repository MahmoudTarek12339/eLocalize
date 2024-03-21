import 'package:elocalize/presentation/search/widgets/search_item.dart';
import 'package:flutter/material.dart';

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
        title: TextFormField(
          controller: _queryController,
          onChanged: (value) {
            //_viewModel.setQuery(_queryController.text);
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
                //_viewModel.setQuery('');
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      body: SizedBox.expand(
        child: StreamBuilder<List<String>>(
          stream: Stream.periodic(const Duration(seconds: 1), (count) {
            return ['Item ${count + 1}', DateTime.now().toString()];
          }).take(5),
          builder: (context, snapShot) {
            if (snapShot.hasData && snapShot.data!.isNotEmpty) {
              return Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SearchItem(snapShot.data![index],_queryController);
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                            height: 2,
                            width: double.infinity,
                            color: const Color(0xff9E9E9E));
                      },
                      itemCount: snapShot.data!.length));
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
