import 'package:flutter/material.dart';

import 'package:general_task/Model/note_hub.dart';

class NoteElement extends StatelessWidget {
  NoteElement({Key? key, this.note}) : super(key: key);
  Note? note;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date =
    new DateTime(now.year, now.month, now.day, now.hour, now.minute);
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(218, 194, 222, 246),
        border: Border.all(color: Color.fromARGB(228, 137, 202, 255)),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("note1"),
         // Text("${note!.title}",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,
          ),
          Text("hello its me from the note bla bla bla "),
          //Text("${note.body}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${date.day}/${date.month} ${date.hour}:${date.minute}",
             //   "${note!.date}",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
