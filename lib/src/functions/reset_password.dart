String? passwordValidation(String password, int maxLength) {
  var errorText = '';

  // Check if the password is empty.
  // if (password.isEmpty) {
  //   errorText = "Password must not be empty \n";
  // }
  if (password.length < maxLength) {
    errorText += 'Password must be at least $maxLength characters long \n';

    // Check if the password contains at least one letter and one number.
  }
  if (!password.contains(RegExp('[0-9]'))) {
    errorText += 'Password must contain at least 1 number \n';
  }

  // Check if the password contains at least one special character.
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    errorText += 'Password must contain at least 1 special character \n';
  }

  // Check if the password contains at least one lowercase letter.
  if (!password.contains(RegExp('(?=.[a-z])'))) {
    errorText += 'Password must contain at least 1 lowercase letter \n';
  }

  // Check if the password contains at least one uppercase letter.
  if (!password.contains(RegExp('.*[A-Z].*'))) {
    errorText += 'Password must contain at least 1 uppercase letter \n';
  }

  // Check if the password is at least the minimum length.

  // Return the error message, or null if the password is valid.
  return errorText.isEmpty ? null : errorText;
}
