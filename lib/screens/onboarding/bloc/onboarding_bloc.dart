import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {

  int pageIndex = 0;

  final pageController = PageController(initialPage: 0);
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>(_nextPage);
  }

  Future<void> _nextPage(OnboardingEvent event, Emitter<OnboardingState> emit) async{
    try {
       if (event is PageChangedEvent) {
      if (pageIndex == 3) {
              emit(NextScreenState());
        return;
      }
      pageIndex += 1;

      pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      emit(PageChangedState(counter: pageIndex));
    } else if (event is PageSwipedEvent) {
      pageIndex = event.index;
      emit(PageChangedState(counter: pageIndex));
    } else  if (event is PresentationPageTappedEvent) {
      emit(PresentationScreenState());
    }
    } catch (e) {
      print(e);
    }
  }

  
}
