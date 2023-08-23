import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/service/todos_service.dart';
import 'package:helloworld/views/cubit/users_cubit.dart';


class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => page2State();
}

class page2State extends State<page2> {

 
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) =>  UsersCubit(),
    child: BlocConsumer<UsersCubit,UsersState>(builder: (context,State){
      if( State is Usersloading){
       return Center(child: CircularProgressIndicator(),
       ); 
      }
      if (State is Userserror){
        return Center(child: Text("Error"),
        );
     }
      return ListView.builder(
      itemCount: context.watch<UsersCubit>().users .length,
      itemBuilder:(BuildContext context , int index){
        return ListTile(
         title: Text(context.watch<UsersCubit>().users[index].name ??"--"),
         subtitle: Text(context.watch<UsersCubit>().users[index].email ??"--"),
          trailing:Icon(Icons.person),
          leading: Text("${index +1}"),

        );
        },
      );

    },
     listener: (context,State){},    
    ),

    );

    
   }
} 




//
//
