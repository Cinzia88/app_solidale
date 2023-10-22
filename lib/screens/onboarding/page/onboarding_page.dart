

import 'package:anf_app/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:anf_app/screens/onboarding/widget/onboarding_content.dart';
import 'package:anf_app/screens/presentation/page/presentation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<OnboardingBloc> _buildBody(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (BuildContext context) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listenWhen: (_, currState) => currState is PresentationScreenState,
        listener: (context, state) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => PresentationPage()));
              
          
          
        },
        buildWhen: (_, currState) => currState is OnboardingInitial,
        builder: (context, state) {
          return const OnboardingContent();
        },
      ),
    );
  }
}
