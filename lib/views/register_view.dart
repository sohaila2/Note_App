import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_task/bloc/User/user_cubit.dart';
import 'package:general_task/core/utils/naviagtion.dart';
import 'package:general_task/services/sp_helper/cache_helper.dart';
import 'package:general_task/views/home_view.dart';

class RegisterView extends StatelessWidget {
 // const RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
 // final TextEditingController emailController = TextEditingController();
 // final TextEditingController passwordController = TextEditingController();
//  TextEditingController username= new TextEditingController();

  var password;
  var email;
 // final String baseUrl = 'https://reqres.in/api';
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> formstate = new GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),

      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          //ToDO :: Check State to Save Token
          if (state is UserSuccessState){
            var token = state.userHub!.accessToken!;
            SharedPreferencesHelper.saveData(key: 'token', value: token);
          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);

          return Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 25,),
                Text('Login',
                  style: TextStyle(color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 25,),
                TextFormField(
                  onSaved: (text) {
                    email = text;
                  },
                  validator: (text) {
                    if (text!.length < 10) {
                      return 'invalid, please Enter your Email address';
                    }
                    return null;
                  },
                  //controller: username,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Email',
                    icon: Icon(Icons.email,color: Colors.black,),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 25,),
                TextFormField(
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Invalid, Please Enter Your Name';
                    }
                    return null;
                  },
                  onSaved: (text) {
                    password = text;
                  },


                  decoration: InputDecoration(
                      labelText: 'Enter Your Password',
                      icon: Icon(Icons.lock, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent)
                      )
                  ),

                ),
                SizedBox(
                  width: 400,
                  height: 50,

                  child: ElevatedButton(onPressed: () {
                    var formdata = formstate.currentState;
                    if (formdata!.validate()) {
                      formdata.save();
                      print('$email');
                      print('$password');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeView()),
                      );
                    }
                    else {
                      print('Invalid');
                    }
                  },
                    child: Text('Submit',
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0))
                        )
                      //side: BorderSide(width: 5.0,color: Colors.white54)
                    ),
                  ),
                ),
              ],),
            ),
          );

        }
      ),

    );
  }
}
