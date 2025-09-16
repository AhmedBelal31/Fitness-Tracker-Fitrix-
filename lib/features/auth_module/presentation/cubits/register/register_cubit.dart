import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void setLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  Future<void> register({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    emit(state.copyWith(isLoading: true));

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // For now, just complete the loading
    emit(state.copyWith(isLoading: false));

    // Here you would typically navigate to login or handle register result
    print(
      'Register attempted with: $userName, $email, $phoneNumber, role: 6806',
    );
  }
}
