import 'package:elocalize/presentation/common/common_widgets/hero_widget.dart';
import 'package:elocalize/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroWidget(
      'Search Book',
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.searchRoute);
          },
          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search Book',
                labelStyle: Theme.of(context).textTheme.labelSmall,
                enabled: false),
          ),
        ),
      ),
    );
  }
}
