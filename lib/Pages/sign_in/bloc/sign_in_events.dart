abstract class SigninEvent {
  const SigninEvent();
}
class EmailEvent extends SigninEvent{
  final String email;
  const EmailEvent({required this.email});
}
class PasswordEvent extends SigninEvent{
  final String password;
  const PasswordEvent({required this.password});
}