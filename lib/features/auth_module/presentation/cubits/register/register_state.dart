part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool isPasswordVisible;
  final bool isLoading;

  const RegisterState({this.isPasswordVisible = false, this.isLoading = false});

  RegisterState copyWith({bool? isPasswordVisible, bool? isLoading}) {
    return RegisterState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isPasswordVisible, isLoading];
}
