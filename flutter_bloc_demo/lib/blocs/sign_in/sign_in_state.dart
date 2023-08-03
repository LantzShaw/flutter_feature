/// @Author: think
/// @Email: TODO
/// @Date: 2023.07.10
/// @Description: TODO

class SignInState {
  int counter;

  SignInState({required this.counter});
}

class InitState extends SignInState {
  InitState() : super(counter: 0);
}
