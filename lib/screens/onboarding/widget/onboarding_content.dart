import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/data_constants.dart';
import 'package:anf_app/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:anf_app/screens/presentation/page/presentation_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "",
                      children: [
                        TextSpan(
                          text: " Salta",
                          style: const TextStyle(
                            color: ColorConstants.titleText,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const PresentationPage()));
                              //  bloc.add(SignInTappedEvent());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 3, child: _createPageView(bloc.pageController, bloc)),
          Expanded(child: _createStatic(bloc)),
        ],
      ),
    );
  }

  Widget _createPageView(PageController controller, OnboardingBloc bloc) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: DataConstants.onboardingTiles,
      onPageChanged: (index) {
        bloc.add(PageSwipedEvent(index: index));
      },
    );
  }

  Widget _createStatic(OnboardingBloc bloc) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      buildWhen: (_, currState) => currState is PageChangedState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DotsIndicator(
            dotsCount: 5,
            position: bloc.pageIndex,
            decorator: const DotsDecorator(
              color: ColorConstants.colorDoctNotActive,
              activeColor: ColorConstants.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
