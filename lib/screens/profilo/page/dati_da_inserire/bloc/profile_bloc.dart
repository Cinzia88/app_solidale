import 'package:anf_app/screens/profilo/page/dati_da_inserire/repository/insert_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_event.dart';
part 'profile_state.dart';



class ProfileDataBloc extends Bloc<ProfileDataEvent, ProfileDataState> {
  final BuildContext context;
  final InsertDataRepository dataProfileRepository;
  ProfileDataBloc({
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
