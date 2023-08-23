part of 'users_cubit.dart';

@immutable
abstract class UsersState { }

class UsersInitial extends UsersState{}
class Usersloading extends UsersState{}
class Userssuccess extends UsersState{}
class Userserror   extends UsersState{}
