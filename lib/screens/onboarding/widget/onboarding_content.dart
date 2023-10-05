
import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/const/data_constants.dart';
import 'package:anf_app/screens/onboarding/bloc/onboarding_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:dots_indicator/dots_indicator.dart';



class OnboardingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: _createPageView(bloc.pageController, bloc),
          ),
          Expanded(
            flex: 2,
            child: _createStatic(bloc),
          ),
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
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        BlocBuilder<OnboardingBloc, OnboardingState>(
          buildWhen: (_, currState) => currState is PageChangedState,
          builder: (context, state) {
            return DotsIndicator(
              dotsCount: 5,
              position: bloc.pageIndex,
              decorator: DotsDecorator(
                color: ColorConstants.colorDoctNotActive,
                activeColor: ColorConstants.primaryColor,
              ),
            );
          },
        ),
        Spacer(),
        BlocBuilder<OnboardingBloc, OnboardingState>(
          buildWhen: (_, currState) => currState is PageChangedState,
          builder: (context, state) {
            final percent = _getPercent(bloc.pageIndex);
            return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: percent),
                duration: Duration(seconds: 1),
                builder: (context, value, _) => CircularPercentIndicator(
                      radius: 80,
                      backgroundColor: ColorConstants.primaryColor,
                      progressColor: ColorConstants.colorDoctNotActive,
                      percent: 1 - value,
                      center: Material(
                        shape: CircleBorder(),
                        color: ColorConstants.primaryColor,
                        child: RawMaterialButton(
                          shape: CircleBorder(),
                          onPressed: () {
                            bloc.add(PageChangedEvent());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.east_rounded,
                              size: 38.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ));
          },
        ),
        SizedBox(height: 30),
      ],
    );
  }

  double _getPercent(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 0.20;
      case 1:
        return 0.40;
      case 2:
        return 0.60;
        case 3:
        return 0.80;
  case 4:
        return 1;
      default:
        return 0;
    }
  }
}
