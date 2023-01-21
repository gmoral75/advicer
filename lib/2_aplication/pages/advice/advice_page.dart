
import 'package:advicer/2_aplication/core/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: themeData.textTheme.headline1,),
        centerTitle: true,
        actions: [
          Switch(value: Provider.of<ThemeService>(context).isDarkModeOn, 
          onChanged: (_) {
            Provider.of<ThemeService>(context, listen: false).toggleTheme();
          })
        ],
      ),
      body: Placeholder(),
    );
  }
}