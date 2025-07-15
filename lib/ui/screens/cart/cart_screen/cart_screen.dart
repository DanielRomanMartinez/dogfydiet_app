import 'package:dogfydiet_app/ui/common/app_layout/app_layout.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {

  static const String routePath = '/$routeName';
  static const String routeName = 'cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      child: Center(
        child: Text(
          'Cart',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
