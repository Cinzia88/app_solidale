import 'package:app_solidale/screens/profilo/page/dati_da_inserire/chiedo_aiuto/repository/insert_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';



class ProfileChiedoAiutoBloc extends Bloc<ProfileDataEvent, ProfileDataState> {
  final BuildContext context;
  final InsertDataChiedoAiutoRepository dataProfileRepository;
  ProfileChiedoAiutoBloc({
    required this.context,
    required this.dataProfileRepository,
  }) : super(ProfileDataInitialState()) {
    on<ProfileDataFormEvent>((event, emit) async {
        emit(ProfileDataLoadedState());
        try {
          await dataProfileRepository.dataFormRepository(
            context,
            event.nome,
            event.cognome,
            event.telefono,
            event.email,
            event.indirizzo,
            event.numeroComponenti,
            event.etaComponenti,
            event.presenzaDisabilita,);
          emit(ProfileDataLoadedState());
        } catch (e) {
          emit(
            ProfileDataErrorState(
              message: e.toString(),
            ),
          );
        }
      
    });
  }
}
