import 'package:get/get_utils/src/get_utils/get_utils.dart';

import 'app_string.dart';

class Validators {
  static String? emailValidator(String? email) {
    email ??= "";
    return email.isEmpty
        ? AppStrings.allStrings.emailOrPhoneIsRequired
        : GetUtils.isEmail(email.trim())
        ? null
        : AppStrings.allStrings.invalidEmailAddress;
  }

  static String? passwordValidator(String? password) {
    password ??= "";
    return password.isEmpty
        ? AppStrings.allStrings.passwordIsRequired
        : !password.contains(RegExp(r"[a-z]")) && !password.contains(RegExp(r"[A-Z]"))
        ? AppStrings.allStrings.atLeast1CharNeeded
        : !password.contains(RegExp("[0-9]"))
        ? AppStrings.allStrings.atLeast1DigitNeeded
        : password.length < 8
        ? AppStrings.allStrings.minimum8Char
        : null;
  }

  static emptyValidator(String? value, String msg) {
    return (value ?? "").trim().isEmpty ? msg : null;
  }

  static moqValidator(String? value) {
    if ((value ?? "").isEmpty) return "MOQ is required";

    try {
      return double.parse(value!)  > 0 ? null : "Minimum MOQ is 1";
    } catch (e) {
      return "Minimum MOQ is 1";
    }
  }

  static String? onlyLetterNumberAndUnderScoreValidation(String? value) {
    value ??= "";
    return value.isEmpty
        ? AppStrings.allStrings.roleTypeIsRequired
        : value.contains(RegExp(r"[!@#<>?:`~$;/'[\]\\|=+)(*&^%0-9]"))
        ? AppStrings.allStrings.roleTypeValidationText
        : null;
  }
}