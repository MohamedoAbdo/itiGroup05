import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/views/svscreen/hoam.dart';
import 'package:helloworld/views/svscreen/page1.dart';
import 'package:helloworld/views/svscreen/signup.dart';
import 'package:helloworld/views/widgtes/mycustom_butten.dart';

import 'package:shared_preferences/shared_preferences.dart';



class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  
  bool ispassword = true;
   final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("welcom"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/logn.png"),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.contains('@gmail.com') ==false){
                      return 'Enter valid Email';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()),
                ),
              ),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordcontroller,
                  obscureText: ispassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value){
                    if(value == null || value.length <8){
                      return 'Enter valid password';
                    }
                  },
                  decoration: InputDecoration(labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon:ispassword ? IconButton(icon: Icon(Icons.visibility_off),
                      onPressed:(){
                        setState(() {
                          ispassword = !ispassword;
                        });
                      } ,):IconButton(icon: Icon(Icons.visibility),
                        onPressed:(){
                          setState(() {
                            ispassword = !ispassword;
                          });
                        } ,),
                      border: OutlineInputBorder()),
                ),
              ),
            SizedBox(
              height: 20,
            ),
             
          
                  
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                bool result =await firebaselogin (emailcontroller.text,passwordcontroller.text);
                   if(result ==true){ 

                  //final SharedPreferences prefs = await SharedPreferences.getInstance();
                  // await prefs.setString('email', emailcontroller.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => hoam()),
                  );
                   }else{ 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('login faild')),
                  );
                   }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                      child: Text("logn",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ),
            ),
             Text(
              "Don’t have an account? ",
                    style: TextStyle(
                     fontSize: 12,

                    )
                  ),
                 
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup()),
                );
               },
                
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 20,
                  
                  child: Center(
                      child: Text("Create ",
                          style: TextStyle(color: Colors.blue, fontSize: 15))),
                ),
              ),
            ),
            Container(
                  width: 300,
                  height: 50,
                  
                  child: Center(
                      child: Text("sign in",
                          style: TextStyle(color: Colors.blue, fontSize: 15))),
                ),
   
         ]
         ),
        ),
      ),
    );
  }
  Future<bool>firebaselogin(String email,String password)async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
   if(userCredential.user !=null){
    return true;
   }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
  return false;
  }
}

