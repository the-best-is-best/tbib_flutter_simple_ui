import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

class LoginScreen extends StatefulWidget {
  final List<String? Function(String?)>? usernameOrEmailValidators;
  const LoginScreen({super.key, this.usernameOrEmailValidators});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return TBIBLoginScreen(
        usernameOrEmailValidators: [FormBuilderValidators.email()],
        onPressed: (
            {ButtonSpinnerState? btnState,
            Function({required bool isSuccess})? isSuccess,
            Function? startLoading,
            Function? stopLoading,
            required Map data}) {
          if (btnState == ButtonSpinnerState.Idle) {
            startLoading!();
            Future.delayed(const Duration(seconds: 2), () {
              stopLoading!();
            });
          }
        });
  }
}
