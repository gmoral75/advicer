import 'package:advicer/2_aplication/pages/advice/bloc/advice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: () {
        // We call the event 
        BlocProvider.of<AdvicerBloc>(context).add(AdviceRequestedEvent());
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