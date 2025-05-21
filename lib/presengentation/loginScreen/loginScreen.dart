import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../block/login_cubit.dart';
import '../../block/login_state.dart';
import '../dashBoard/dashboardscreen.dart';

class LoginScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login Success! Token: ${state.token}")),
            );
            print('-----19---xxxxx----------${state.token}');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboardscreen()),
            );
            //
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login Failed: ${state.message}")),
            );
          }
        },
        builder: (context, state) {
          final loginCubit = context.read<LoginCubit>();
          return Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/logo.png', height: 200),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Mobile'),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(height: 30),
                    state is LoginLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final pass = passwordController.text.trim();
                        print('--------xxx-----');

                        context.read<LoginCubit>().login(email, pass);

                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
