import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_task/comoonents/note.dart';
import 'package:general_task/core/utils/naviagtion.dart';
import 'package:general_task/services/sp_helper/cache_helper.dart';
import 'package:general_task/views/register_view.dart';
import 'package:general_task/bloc/note/note_cubit.dart';

import 'add_new_note.dart';
class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var noteCubit = NoteCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [IconButton(onPressed: () {
          noteCubit.getAllNotes();
        }, icon: Icon(Icons.refresh))],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewNote()));
          },
          child: Icon(Icons.add)),
      body: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          noteCubit.getAllNotes();
          return ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return NoteElement(note: noteCubit.notes[index],);
              },
              itemCount: noteCubit.notes.length);
        },
      ),
      // body: Center(
      //   child:  ElevatedButton(
      //     child: Text("Logout"),
      //     onPressed: (){
      //       // ToDo ::  Remove Token and navigate
      //       SharedPreferencesHelper.removeData(key: 'token');
      //
      //     },
      //   ),
      // ),

    );
  }
}
