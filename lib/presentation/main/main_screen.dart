import 'package:elocalize/presentation/addBook/view/add_book_view.dart';
import 'package:elocalize/presentation/books/view/books_view.dart';
import 'package:elocalize/presentation/common/common_widgets/hero_widget.dart';
import 'package:elocalize/presentation/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 4;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          HeroWidget(
            'Search Book',
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchView()));
                },
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(Icons.search),
                      labelText: 'Search Book',
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      enabled: false),
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimationLimiter(
              child: GridView.count(
                padding: EdgeInsets.all(w / 120),
                crossAxisCount: columnCount,
                children: List.generate(
                  16,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        scale: 1.5,
                        child: FadeInAnimation(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const BooksView()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: w / 30, left: w / 60, right: w / 60),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 40,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                              child: const FittedBox(
                                  child: Icon(
                                Icons.library_books,
                                size: 300,
                                color: Colors.blueGrey,
                              )),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20.0,
            width: double.infinity,
            child: Card(
              elevation: 30,
              color: Colors.white,
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFD22120),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddBookView()));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
