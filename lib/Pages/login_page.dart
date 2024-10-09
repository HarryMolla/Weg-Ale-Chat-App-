import 'package:flutter/material.dart';
import 'package:weg_ale/services/autho/auth_service.dart';
import 'package:weg_ale/components/my_textfiled.dart';
import 'package:weg_ale/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final void Function()? onTap;

  void login(BuildContext context) async {

    //auth service
    final authService = AuthService();
    //try login
    try {
      await authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      if (context.mounted) {
      showDialog(
          context:  context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
    }
    //cathc any error
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                Icon(Icons.message,
                    size: 150, color: Theme.of(context).colorScheme.primary),
                const SizedBox(
                  height: 5,
                ),
                //wellcome
                Text(
                  'Welcome back, You have been missed!',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  height: 50,
                ),

                //Email
                MyTextfiled(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'Email',
                ),

                //Password
                MyTextfiled(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password',
                ),

                //Login button
                MyButton(
                  text: 'LOGIN',
                  onTap: () => login(context),
                ),
               
                const SizedBox(
                  height: 10,
                ),

                //Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('You dont have an account'),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
