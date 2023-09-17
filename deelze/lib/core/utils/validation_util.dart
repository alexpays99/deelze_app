abstract class ValidationUtil {
  ///r'^
  ///(?=.*[A-Z])       // should contain at least one upper case
  ///(?=.*[a-z])       // should contain at least one lower case
  ///(?=.*?[0-9])      // should contain at least one digit
  ///(?=.*?[!@#\$&*~]) // should contain at least one Special character
  ///.{8,}             // Must be at least 8 characters in length
  ///$
  static RegExp hasEightCharacters = RegExp(r'^.{8,20}$');
  static RegExp hasUppercase = RegExp(r'[A-Z]');
  static RegExp hasLowercase = RegExp(r'[a-z]');
  static RegExp hasDigit = RegExp(r'[0-9]');
  static RegExp hasSpecialCharacter = RegExp(r'[-!@#\$&*~_"]');
  static RegExp hasCyrylic = RegExp(r'[а-яА-Я]');
  static RegExp hasAllowedNameCharacters = RegExp(r"^[a-zA-Zа-яА-Я\s\']+$");
  static RegExp confirmationCodeValidator = RegExp(r'^([0-9]){6}$');
  static RegExp hasEmodji = RegExp(r'[^\x00-\x7F]+');

  static final RegExp nameRegExp = RegExp(
      r"^(?=.{2,35}$)[єЄіІїЇыЫёЁа-яА-Яa-zA-Z'\-.]{2,35}(?:\s[єЄіІїЇыЫёЁа-яА-Яa-zA-Z'\-.]{1,35})?[єЄїЇыЫёЁа-яА-Яa-zA-Z'\-.]{0,35}$");
  static final RegExp emailValidationRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\])|(([a-zA-Z\-\d]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp passwordValidationRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~]).{8,}$');

  static String? validateEmail(String? value) {
    if (value != null && emailValidationRegExp.hasMatch(value)) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  static String? validatePassword(String? value) {
    if (value != null && passwordValidationRegExp.hasMatch(value)) {
      return null;
    } else {
      return 'Please enter a valid password';
    }
  }

  static String? validateName(String? value) {
    if (value != null && nameRegExp.hasMatch(value)) {
      return null;
    } else {
      return 'Please enter a valid name';
    }
  }
}
