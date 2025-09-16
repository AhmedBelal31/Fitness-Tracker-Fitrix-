import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // For now, just complete the loading
    emit(state.copyWith(isLoading: false));

    // Here you would typically navigate to home or handle login result
    print('Login attempted with: $email');
  }
}
