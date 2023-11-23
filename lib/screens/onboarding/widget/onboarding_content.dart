import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/const/data_constants.dart';
import 'package:app_solidale/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardingContent extends StatefulWidget {
  const OnboardingContent({super.key});

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent> {
  bool viewSlide = true;
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight =mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
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
                          style:  TextStyle(
                            color: ColorConstants.titleText,
                            fontSize: 2.5 * blockSizeVertical,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              setState(() {
                                viewSlide = false;
                              });
                              bloc.add(PresentationPageTappedEvent());
                              await valueSharedPrefsViewSlide
                                  .setValueViewSlide(viewSlide);
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
            dotsCount: 4,
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
