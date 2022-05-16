import 'package:flutter/material.dart';

import 'home_view.dart';

class NewNote extends StatelessWidget {
  NewNote({Key? key}) : super(key: key);
 // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Build a Form widget using the _formKey created above.
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          // image: DecorationImage(
          //     image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 200),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    color: Color.fromARGB(189, 222, 222, 222)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Note',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.topic_outlined),
                          hintText: 'Enter Title',
                          labelText: 'Title',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.note_alt_rounded),
                          hintText: 'Enter Note',
                          labelText: 'Note',
                        ),
                      ),
                      Container(
                          padding:
                          const EdgeInsets.only(left: 150.0, top: 40.0),
                          child: ElevatedButton(
                            child: const Text('Submit'),
                            onPressed: () {
                              var formdata = formKey.currentState;
                              if (formdata!.validate()) {
                                formdata.save();

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()),
                                );
                              }

                            }
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),

      ),

   // Padding(
   //  child:  ElevatedButton(
   //    child: Text("Logout"),
   //    onPressed: (){
   //      // ToDo ::  Remove Token and navigate
   //      SharedPreferencesHelper.removeData(key: 'token');
   //
   //    },
   //  ),
   // ),
    );
  }
}
