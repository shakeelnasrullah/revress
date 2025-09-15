import 'package:flutter/material.dart';
import 'package:revress/app_colors.dart';
import 'package:revress/dashboard/dashboard_screen.dart';
import 'package:revress/login/login_bloc.dart';
import 'package:revress/login/login_event.dart';
import 'package:revress/login/login_status.dart';
import 'package:revress/signup/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: BlocConsumer<LoginBloc, LoginStatus>(
            listener: (context, state) {
              if (state.formStatus is SubmissionSuccess) {
                // Navigate to home screen on success
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login successful!')),
                );
              }

              if (state.formStatus is SubmissionFailed) {
                final error = (state.formStatus as SubmissionFailed).error;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error)),
                );
              }
            },
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight - 32,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20),
                          Image.asset(
                            "assets/images/app_icon.png",
                            width: 250,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Text(
                                  "Welcome to Revress!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppColors.darkGray,
                                  ),
                                ),
                                Text(
                                  "Sign in To Resume Your Journey",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17,
                                    color: AppColors.lightGray,
                                  ),
                                ),
                                SizedBox(height: 20),
                                _buildEmailField(context),
                                SizedBox(height: 16),
                                _buildPasswordField(context),
                                SizedBox(height: 30),
                                _buildRememberMeRow(context, state),
                                SizedBox(height: 30),
                                _buildLoginButton(context, state),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          _buildSignUpRow(context),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _requireTextLabel("Email Address"),
        TextField(
          onChanged: (value) => context.read<LoginBloc>().add(LoginEmailChanged(value)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            hintText: "Enter Your Email",
            hintStyle: TextStyle(color: AppColors.lightGray),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _requireTextLabel("Password"),
        TextField(
          onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(value)),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: "Enter Password",
            hintStyle: TextStyle(color: AppColors.lightGray),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeRow(BuildContext context, LoginStatus state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: state.rememberMe,
              onChanged: (value) => context.read<LoginBloc>().add(
                  LoginRememberMe(value ?? false)
              ),
              checkColor: AppColors.white,
              activeColor: AppColors.primary,
              fillColor: WidgetStateProperty.all(AppColors.primary),
            ),
            Text(
              "Remember Me",
              style: TextStyle(color: AppColors.darkGray, fontSize: 14),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password",
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginStatus state) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        onPressed: state.formStatus is FormSubmitting
            ? null
            : () => context.read<LoginBloc>().add(LoginSubmitted()),
        child: state.formStatus is FormSubmitting
            ? CircularProgressIndicator(color: Colors.white)
            : Text('Login', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildSignUpRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.lightGray,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _requireTextLabel(String name) {
    return Row(
      children: [
        Text(name, style: TextStyle(color: AppColors.darkGray, fontSize: 14)),
        Text("*", style: TextStyle(color: AppColors.error)),
      ],
    );
  }
}