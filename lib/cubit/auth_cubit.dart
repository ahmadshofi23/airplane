import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoadig());
      UserModel user =
          await AuthService().signIn(email: email, pasword: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      emit(AuthLoadig());

      UserModel user = await AuthService().signUp(
        email: email,
        pass: password,
        name: name,
        hobby: hobby,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoadig());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserByID(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
