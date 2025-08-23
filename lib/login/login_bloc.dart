
import 'package:revress/login/login_event.dart';
import 'package:revress/login/login_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStatus> {
  LoginBloc() : super(const LoginStatus()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginRememberMe>(_onRememberMeChanged);
    on<LoginSubmitted>(_onSubmitted);
  }


  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginStatus> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginStatus> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onRememberMeChanged(LoginRememberMe event, Emitter<LoginStatus> emit) {
    emit(state.copyWith(rememberMe: event.rememberMe));
  }

  void _onSubmitted(LoginSubmitted event, Emitter<LoginStatus> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Validate email and password
      if (state.email.isEmpty || state.password.isEmpty) {
        throw Exception('Please fill in all fields');
      }

      if (!_isValidEmail(state.email)) {
        throw Exception('Please enter a valid email');
      }

      // Here you would typically call your authentication service
      // await authService.login(state.email, state.password);

      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}