import 'package:bloc/bloc.dart';
import 'package:helloworld/models/todos_models.dart';
import 'package:helloworld/service/todos_service.dart';
import 'package:meta/meta.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial()) {getMyUsers();}

  List<TodoModel>users =[];
   getMyUsers()async {
     emit(Usersloading());
    users =await todosservice().getusers();
        emit(Userssuccess());
        

    
  }

}
