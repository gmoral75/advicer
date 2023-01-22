import 'package:advicer/2_aplication/core/services/theme_service.dart';
import 'package:advicer/2_aplication/pages/advice/bloc/advice_bloc.dart';
import 'package:advicer/2_aplication/pages/advice/widgets/advice_field.dart';
import 'package:advicer/2_aplication/pages/advice/widgets/custom_button.dart';
import 'package:advicer/2_aplication/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Advicer',
            style: themeData.textTheme.headline1,
          ),
          centerTitle: true,
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(child: Center(
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                  builder: (context, state) {
                    if (state is AdviceInitial) {
                      return Text('Your Advice is waiting for you', style: themeData.textTheme.headline1,);
                    } else if (state is AdviceStateError) {
                      return ErrorMessage(message: state.message);
                    } else if (state is AdviceStateLoaded) {
                      return AdviceField(advice: state.advice,);
                    } else if (state is AdviceStateLoading) {
                      return CircularProgressIndicator(color: themeData.colorScheme.secondary,);
                    }
                    return const SizedBox();
                  },
                ),
              )),
              const SizedBox(height: 100, child: Center(child: Custombutton()))
            ],
          ),
        ));
  }
}
