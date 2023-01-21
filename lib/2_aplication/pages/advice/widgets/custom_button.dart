import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () {
        print('Button Preset');
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeData.colorScheme.secondary
          ),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15), 
          child: Text(
            'Get Advice', 
            style: themeData.textTheme.headline1,),
            ),
        ),
      ),
    );
  }
}