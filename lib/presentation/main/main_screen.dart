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
        child: Column(
            /*heroWidget(
              'search Recipe',
              ),*/
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, Routes.searchRecipe);
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
                                  //print(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      bottom: w / 30,
                                      left: w / 60,
                                      right: w / 60),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
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
            ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
