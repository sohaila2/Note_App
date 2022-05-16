import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:general_task/Model/note_hub.dart';
import 'package:general_task/services/dio_helper/dio_service.dart';
import 'package:general_task/services/sp_helper/cache_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context)=>BlocProvider.of(context);

  List<Note> notes = [];
  late NoteHub noteHub;
  void getAllNotes(){
    // Todo :: Create get data
    emit(NoteLoadingState());
    DioHelper.getData(url: "user/" , token: SharedPreferencesHelper.getData(key: 'token')).then((value) {
     // noteHub = NoteHub.fromJson(value.data);

      var jsonData = jsonDecode(value.data);

      noteHub = NoteHub.fromJson(jsonData);
      for (var note in noteHub.note) notes.add(note);
      emit(NoteSuccessState());
    }).catchError((onError){
      emit(NoteErrorState());
    });
  }

}
