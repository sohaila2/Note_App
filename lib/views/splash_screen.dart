import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_task/core/utils/naviagtion.dart';
import 'package:general_task/core/utils/size_config.dart';
import 'package:general_task/services/sp_helper/cache_helper.dart';
import 'package:general_task/views/home_view.dart';
import 'package:general_task/views/register_view.dart';



class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(

      body: Center(
        child: Image.network(
          'https://cdn.dribbble.com/users/7140190/screenshots/16481690/media/dd4b979c530389b8a3c6003d57576f06.jpg?compress=1&resize=1200x900&vertical=top',
        ),
      ),

    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    var token = SharedPreferencesHelper.getData(key: 'token');
    if (token == null)
      AppNavigator.customNavigator(context: context, screen: RegisterView(), finish: true);
    else
      AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
    //TODO :: Get token and   Check it
  }


}
