import 'dart:math';

import 'package:elocalize/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class BooksWidget extends StatefulWidget {
  final int index;
  final double value;
  final String title;

  const BooksWidget(this.index, this.value, this.title, {super.key});

  @override
  State<BooksWidget> createState() => _BooksWidgetState();
}

class _BooksWidgetState extends State<BooksWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initTransitionAnimation();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    //here we get the value scrolled from page to determine rotation
    double diff = widget.index - widget.value;

    //here we used fraction power to scale the difference to be greater
    double rotation = 1.3 * pow(diff, 0.25);

    return InkWell(
        //_opedDetailsPage(index)
        onTap: () => {},
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                  scale: _animation.value,
                  child: Card(
                      elevation: 20.0,
                      shadowColor: Colors.black.withOpacity(0.1),
                      child: Transform(
                          transform: Matrix4.rotationY(rotation),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              //book cover image
                              const Image(
                                image: AssetImage('assets/book_bg.png'),
                                fit: BoxFit.fill,
                              ),
                              //book title
                              SizedBox(
                                width: w * 0.4,
                                height: h * 0.3,
                                child: Center(
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                      color: ColorManager.darkRed,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 42,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))));
            }));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //initialize animation controllers
  _initTransitionAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation =
        Tween<double>(begin: 1.0, end: 1.7).animate(_animationController);
  }
}
