import 'package:dogfydiet_app/ui/theme/colors_map.dart';
import 'package:flutter/material.dart';

class PageNotFoundScreen extends StatelessWidget {

  static const String routeName = 'page-not-found';

  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsMap.neutral250,
      body: Center(
        child: Text('Not found'),
      ),
    );
  }
}
