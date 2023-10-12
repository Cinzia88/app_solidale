
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/signup_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
  final SignupRepository signupRepository;

  SignUpBloc({
    required this.signupRepository,
  }) : super(SignupInitial()) {
    on<SignUpTappedEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        await signupRepository.registerUser(
            event.email, event.password, event.confirmPassword);
        emit(SignupLoaded());
      } catch (e) {
        emit(
          SignupErrorState(
            message: e.toString(),
          ),
        );
      }
if (event is SignInTappedEvent) {
      emit(NextSignInPageState());
    }
      
    });
  }

  
}
