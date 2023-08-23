import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Loginscreen.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => page1State();
}

class page1State extends State<page1> {
String email="";
getCachedEmail() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  email =prefs.getString('email')??"--";
  setState(() {});

}

@override
  void initState() {
    super.initState();
    getCachedEmail();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("page1 \n $email"),) ;
  }
}
//