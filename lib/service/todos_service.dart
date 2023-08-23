
import 'package:dio/dio.dart';
import 'package:helloworld/models/todos_models.dart';

class todosservice{
String url="https://jsonplaceholder.typicode.com/todos";

getusers() async {
  List<TodoModel>userslist =[];
   final response = await Dio().get(url);
var data =response.data;
data.forEach((element){
  TodoModel user = TodoModel.fromJson(element);
  userslist.add(user);
});
return userslist;
} 


}


