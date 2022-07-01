

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/models/session_model.dart';


import 'progress_states.dart';

class ProgressCubit extends Cubit<ProgressStates>{
  ProgressCubit( ) : super(ProgressInitialState());

  static ProgressCubit get(context)=>BlocProvider.of(context);

  List<SessionModel> sessions=[];

  Future<void> getSessions () async {
    emit(GetProgressLoadingState());
  await FirebaseFirestore.instance
        .collection('sessions')
        .get()
        .then((value){
          value.docs.forEach((element) {
            sessions.add(SessionModel.fromJson(element.data()));
          });
          emit(GetProgressSuccessState());

  }).catchError((e){
      print('${e.toString()}');
      emit(GetProgressErrorState(e.toString()));

  });
  }


}