import 'package:flutter/material.dart';
import 'package:tbib_flutter_simple_ui/tbib_flutter_simple_ui.dart';

/// Login screen

class TBIBLoginScreen extends StatefulWidget {
  /// constructor
  const TBIBLoginScreen({
    required this.onPressed,
    super.key,
    this.backgroundColor,
    this.logo = const FlutterLogo(
      size: 50,
    ),
    this.iconColorForm,
    this.title,
    this.subTitle,
    this.usernameOrEmailTitleFormField,
    this.styleFormFieldTitle,
    this.passwordTitleFormField,
    this.titleStyle,
    this.subTitleStyle,
    this.usernameOrEmailValidators,
    this.passwordValidator,
    this.styleFormField,
    //this.onSaved,
    this.titleButtonLogin = 'Login',
    this.textFormFieldDecoration,
    this.spaceBetweenFormAndLoginButton,
    this.userNameOrEmailName,
    this.passwordName,
  });

  /// default color from Theme.of(context).colorScheme.primaryContainer
  final Color? backgroundColor;

  /// [logo] add your logo default is FlutterLogo
  final Widget logo;

  /// [title] add your title default is Welcome back
  final String? title;

  /// [titleStyle] add your titleStyle
  final TextStyle? titleStyle;

  /// [subTitle] add your subTitle default is Login to your account
  final String? subTitle;

  /// [subTitleStyle] add your subTitleStyle default is Theme.of(context).textTheme.bodyMedium
  final TextStyle? subTitleStyle;

  /// [usernameOrEmailTitleFormField] add your usernameText default is Username
  final String? usernameOrEmailTitleFormField;

  /// [usernameOrEmailValidators] use FormBuilderValidators and default add required
  final List<String? Function(String?)>? usernameOrEmailValidators;

  /// [styleFormFieldTitle] add your usernameOrEmailTitleFormField default is Theme.of(context).textTheme.bodyMedium
  final TextStyle? styleFormFieldTitle;

  /// [styleFormField] add style to form field
  final TextStyle? styleFormField;

  /// [passwordTitleFormField] add your passwordTextFormField default is Password
  final String? passwordTitleFormField;

  /// [passwordValidator] add default
  final List<String? Function(String?)>? passwordValidator;

  /// [onSaved] add your onSaved

  // final void Function(String?)? onSaved;

  /// [titleButtonLogin] add your titleButtonLogin default is Login
  final String titleButtonLogin;

  /// [textFormFieldDecoration] add your textFormFieldDecoration
  final InputDecoration? textFormFieldDecoration;

  /// [spaceBetweenFormAndLoginButton] add your space Between Form And Login Button
  final double? spaceBetweenFormAndLoginButton;

  /// [iconColorForm] add your icon color suffixIcon
  final Color? iconColorForm;

  /// [usernameOrEmailName] key in api
  final String? userNameOrEmailName;

  /// [passwordName] key in api
  final String? passwordName;

  /// [onPressed] add your onPressed and get some functions
  final void Function({
    required ButtonSpinnerState btnState,
    required void Function({required bool isSuccess}) isSuccess,
    required Function startLoading,
    required Function stopLoading,
    required Map<String, dynamic> data,
  }) onPressed;

  @override
  State<TBIBLoginScreen> createState() => _TBIBLoginScreenState();
}

class _TBIBLoginScreenState extends State<TBIBLoginScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final FocusNode _focusNodePassword = FocusNode();
  // final TextEditingController _controllerUsername = TextEditingController();
  // final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;
  TextStyle? labelStyle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      labelStyle = Theme.of(context)
          .inputDecorationTheme
          .labelStyle
          ?.copyWith(color: Colors.white);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ??
          Theme.of(context).colorScheme.primaryContainer,
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 150),
              widget.logo,
              const SizedBox(height: 10),
              Text(
                widget.title ?? 'Welcome back',
                style:
                    widget.titleStyle ?? getBoldStyle(fontSize: FontSize.s28),
              ),
              const SizedBox(height: 10),
              Text(
                widget.subTitle ?? 'Login to your account',
                style: widget.subTitleStyle ??
                    getMediumStyle(fontSize: FontSize.s16),
              ),
              const SizedBox(height: 60),
              MyFormField(
                keyWidget: widget.userNameOrEmailName ?? 'username',
                formFieldStyle: widget.styleFormFieldTitle,
                //   controller: _controllerUsername,
                keyboardType: TextInputType.name,
                label: widget.usernameOrEmailTitleFormField ?? 'Username',
                prefixIcon:
                    Icon(Icons.person_outline, color: widget.iconColorForm),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  ...?widget.usernameOrEmailValidators?.map((e) => e),
                ]),
                nextFocusNode: _focusNodePassword,
                // onSaved: widget.onSaved,
                decoration: widget.textFormFieldDecoration ??
                    InputDecoration(
                      labelStyle: labelStyle,
                      border: Theme.of(context)
                          .inputDecorationTheme
                          .border
                          ?.copyWith(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                      enabledBorder: Theme.of(context)
                          .inputDecorationTheme
                          .enabledBorder
                          ?.copyWith(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                      focusedBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedBorder
                          ?.copyWith(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                    ),
              ),
              const SizedBox(height: 10),
              MyFormField(
                keyWidget: widget.passwordName ?? 'password',
                //  controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                formFieldStyle: widget.styleFormField,
                label: widget.passwordTitleFormField ?? 'Password',
                prefixIcon:
                    Icon(Icons.password_outlined, color: widget.iconColorForm),
                suffixIcon: IconButton(
                  color: widget.iconColorForm,
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: _obscurePassword
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),

                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                    ...?widget.passwordValidator?.map((e) => e),
                  ],
                ),
                // onSaved: widget.onSaved,
                decoration: widget.textFormFieldDecoration ??
                    InputDecoration(
                      labelStyle: labelStyle,
                      border: Theme.of(context)
                          .inputDecorationTheme
                          .border
                          ?.copyWith(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                      enabledBorder: Theme.of(context)
                          .inputDecorationTheme
                          .enabledBorder
                          ?.copyWith(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                      focusedBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedBorder
                          ?.copyWith(
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                    ),
              ),
              SizedBox(
                height: widget.spaceBetweenFormAndLoginButton ?? 30,
              ),
              Column(
                children: [
                  MyButtonWithLoader(
                    width: context.screenSize.width,
                    // style: ElevatedButton.styleFrom(
                    //   minimumSize: const Size.fromHeight(50),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20),
                    //   ),
                    // ),
                    onPressed: ({
                      ButtonSpinnerState? btnState,
                      void Function({required bool isSuccess})? isSuccess,
                      Function? startLoading,
                      Function? stopLoading,
                    }) {
                      if (_formKey.currentState!.saveAndValidate()) {
                        _formKey.currentState!.save();
                        widget.onPressed.call(
                          btnState: btnState!,
                          isSuccess: isSuccess!,
                          startLoading: startLoading!,
                          stopLoading: stopLoading!,
                          data: _formKey.currentState!.value,
                        );
                      }
                    },
                    title: widget.titleButtonLogin,
                    titleStyle: getRegularStyle(fontSize: FontSize.s16),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text("Don't have an account?"),
                  //     TextButton(
                  //       onPressed: () {
                  //         _formKey.currentState?.reset();
                  //       },
                  //       child: const Text('Signup'),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _focusNodePassword.dispose();
  //   _controllerUsername.dispose();
  //   _controllerPassword.dispose();
  //   super.dispose();
  // }
}
