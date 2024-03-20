import 'dart:math';

import 'package:flutter/material.dart';

class BooksWidget extends StatefulWidget {
  final int index;
  final double value;

  const BooksWidget(this.index, this.value, {super.key});

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

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: h*0.8
      ),
      child: AspectRatio(
        aspectRatio: 0.95,
        child: InkWell(
            //_opedDetailsPage(index)
            onTap: () => {},
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                      scale: _animation.value,
                      child: SizedBox(
                        height: h*0.4,
                        child: Card(
                            elevation: 10.0,
                            shadowColor: Colors.black.withOpacity(0.1),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Transform(
                                transform: Matrix4.rotationY(rotation),
                                child: const Image(
                                  image: AssetImage(
                                      'assets/The_Alchemist.png'),
                                  fit: BoxFit.fill,
                                ))),
                      ));
                })),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  } //initialize animation controllers

  _initTransitionAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation =
        Tween<double>(begin: 1.0, end: 1.7).animate(_animationController);
  }
}
