
import 'package:advicer/2_aplication/core/services/theme_service.dart';
import 'package:advicer/2_aplication/pages/advice/widgets/advice_field.dart';
import 'package:advicer/2_aplication/pages/advice/widgets/custom_button.dart';
import 'package:advicer/2_aplication/pages/advice/widgets/error_message.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
            //child: ErrorMessage(message: 'upps something gone wrong!'),
            //child: AdviceField(advice: 'Example advice')   
              /*CircularProgressIndicator(
                color: themeData.colorScheme.secondary,)*/
              /*Text(
                'Your Advice is waiting for you', 
                style: themeData.textTheme.headline1,
                ),*/
              )),
              const SizedBox(
              height: 100,
              child: Center(child: Custombutton()))
          ],
        ),
        ));
  }
}