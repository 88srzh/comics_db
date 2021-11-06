import 'dart:math';

import 'package:comics_db_app/app_colors.dart';
import 'package:comics_db_app/library/widgets/inherited/notifier_provider.dart';
import 'package:comics_db_app/resources/resources.dart';
import 'package:comics_db_app/ui/widgets/auth/auth_model.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> with SingleTickerProviderStateMixin {
  // If we want to show SignUp
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController = AnimationController(vsync: this, duration: AppColors.defaultDuration);
    _animationTextRotate = Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
      _isShowSignUp ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final model = AuthProvider.read(context)?.model;
    final model = NotifierProvider.read<AuthModel>(context);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Stack(
            // padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              // Login Form
              AnimatedPositioned(
                duration: AppColors.defaultDuration,
                // use 88% for login
                width: _size.width * 0.88,
                height: _size.height,
                left: _isShowSignUp ?  - _size.width * 0.76 : 0,
                child: Container(
                  color: AppColors.loginBackground,
                  child: loginFormColumnPadding(context, model),
                ),
              ),
              // SignUp
              AnimatedPositioned(
                duration: AppColors.defaultDuration,
                height: _size.height,
                  width: _size.width * 0.88,
                  left:  _isShowSignUp ?_size.width * 0.12 : _size.width * 0.88,
                  child: Container(
                    color: AppColors.signUpBackground,
                    // change to SignUpForm
                    child: loginFormColumnPadding(context, model),
                  ),
              ),
              // LOGO
              AnimatedPositioned(
                duration: AppColors.defaultDuration,
                top: _size.height * 0.1,
                  left: 0,
                  right: _isShowSignUp ? - _size.width * 0.06 : _size.width * 0.06,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: AnimatedSwitcher(
                      duration: AppColors.defaultDuration,
                      child: _isShowSignUp ? Image.asset(AppImages.logo) : Image.asset(AppImages.logo),
                    ),
                  ),
              ),
              // SignIn animation
              AnimatedPositioned(
                duration: AppColors.defaultDuration,
                bottom: _isShowSignUp ? _size.height / 2 -55 : _size.height * 0.15,
                  left: _isShowSignUp ? 0 : _size.width * 0.44 - 55,
                  child: AnimatedDefaultTextStyle(
                    duration: AppColors.defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _isShowSignUp ? 20 : 30,
                        fontWeight: FontWeight.bold,
                        color: _isShowSignUp ? Colors.white : Colors.white70),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          if (_isShowSignUp) {
                            updateView();
                          } else {
                            // LOGIN
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: AppColors.defaultPadding * 0.75),
                          width: 110,
                          // color: Colors.red,
                          child: Text(
                            'Войти'.toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
              AnimatedPositioned(
                duration: AppColors.defaultDuration,
                bottom: !_isShowSignUp ? _size.height / 2 - 55 : _size.height * 0.15,
                right: _isShowSignUp ? _size.width * 0.44 - 55 : 0,
                child: AnimatedDefaultTextStyle(
                  duration: AppColors.defaultDuration,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: !_isShowSignUp ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70),
                  child: Transform.rotate(
                    angle: (90 - _animationTextRotate.value) * pi / 180,
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        if (_isShowSignUp) {
                          // SignUp
                        } else {
                          updateView();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: AppColors.defaultPadding * 0.75),
                        width: 170,
                        // color: Colors.red,
                        child: Text(
                          'Регистрация'.toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            // child: loginFormColumnPadding(context, model),
          );
        }
      ),
    );
  }

  Padding loginFormColumnPadding(BuildContext context, AuthModel? model) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const ErrorMessageWidget(),
                TextFormField(
                  controller: model?.loginTextController,
                  autofocus: true,
                  decoration: formFieldInputDecoration('Почта'),
                ),
                const SizedBox(height: 10),
                // buildPasswordFormField(),
                TextFormField(
                  controller: model?.passwordTextController,
                  obscureText: true,
                  decoration: formFieldInputDecoration('Пароль'),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            resetPasswordRow(),
            const SizedBox(height: 20.0),
            // loginButton(),
            const AuthButtonWidget(),
          ],
        ),
      );
  }

  InputDecoration formFieldInputDecoration(String labelText) {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        // border: const OutlineInputBorder(),
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: AppColors.kPrimaryColor),
        // ),
        filled: true,
        labelText: labelText,
        fillColor: Colors.white38);
  }

  Row resetPasswordRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          child: const Text(
            'Забыли пароль?',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const CircularProgressIndicator(strokeWidth: 5.0)
        : const Text(
            'Войти',
            // style: TextStyle(fontSize: 24, color: Colors.black),
          );
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
          side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.kPrimaryColor)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(AppColors.kPrimaryColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
          ),
        ),
      ),
    );
  }
}

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
