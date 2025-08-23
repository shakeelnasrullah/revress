
class LoginStatus {
  final String email;
  final String password;
  final bool rememberMe;
  final FormSubmissionStatus formStatus;

  const LoginStatus({this.email = "", this.password = "", this.rememberMe = false, this.formStatus = const InitialFormStatus(),});

  LoginStatus copyWith({String? email, String? password, bool? rememberMe, FormSubmissionStatus? formStatus}) {
    return LoginStatus(
    email: email ?? this.email,
    password: password ?? this.password,
    rememberMe: rememberMe ?? this.rememberMe,
    formStatus: formStatus ?? this.formStatus,
    );
}
}
abstract class FormSubmissionStatus {
const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final String error;

  const SubmissionFailed(this.error);
}