abstract class StringValidator{
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator{
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
  
}
class EmailAndPasswordValidators{
  final StringValidator emailValidator=NonEmptyStringValidator();
  final StringValidator passwordValidator=NonEmptyStringValidator();
  final String InvalidEmailErrorText='Email can\'t be Empty';
  final String InvalidPasswordErrorText='Password can\'t be Empty';
}