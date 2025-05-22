
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  // here is a point to understand here
  // if response get is sucess then i forward
  // token so here i get a token
  // here data may be in a module format or a
  // any other format
  final String token;
  LoginSuccess(this.token);
}
class LoginFailure extends LoginState {
  // if data failed then forward ui a msg
  final String message;
  LoginFailure(this.message);
}
// Here we used a LoginState , this same state is
// used all post api but we change the name
// for example LoginState to RegisterState ..etc