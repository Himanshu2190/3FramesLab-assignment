class Validation {
  static String? validateEmail(String value) {
    RegExp emailValid = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.trim().isEmpty) {
      return "Email can't be blank";
    } else if (!emailValid.hasMatch(value.toString().trim())) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    RegExp passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.trim().isEmpty) {
      return "Password can't be blank";
    } else if (value.trim().length < 8) {
      return 'The Password must be at least 8 characters';
    } else if (!passwordValid.hasMatch(value)) {
      return 'Required 1 Capital, 1 special and 1 numeric character';
    }
    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.trim().isEmpty) {
      return "Please Confirm Your Password";
    } else if (value.trim() != password) {
      return "Please Match Your Password";
    }

    return null;
  }

  static String? validateEmptyPassword(String value) {
    if (value.trim().isEmpty) {
      return "Please Enter Your Password";
    }

    return null;
  }
}
