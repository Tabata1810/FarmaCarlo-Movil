import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/inventory_catalog_screen.dart';

void main() {
  runApp(const FarmaCarloApp());
}

class FarmaCarloApp extends StatelessWidget {
  const FarmaCarloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmaCarlo Móvil',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const InventoryCatalogScreen(),
    );
  }
}