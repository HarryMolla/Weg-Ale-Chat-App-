import 'package:flutter/material.dart';
import 'package:weg_ale/components/my_textfiled.dart';
import 'package:weg_ale/components/my_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key, required this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController =TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confiormpassworController =
      TextEditingController();
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
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
                    'Welcome to Weg ale',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
              
                  //User Name
                  MyTextfiled(
                    controller: userNameController,
                    obscureText: false,
                    hintText: 'User Name',
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
              
                  //Coniform Password
                  MyTextfiled(
                    controller: confiormpassworController,
                    obscureText: true,
                    hintText: 'Coniform Password',
                  ),
              
                  //Login button
                  MyButton(
                    text: 'REGISTER',
                    onTap: () {},
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
                          "LOGIN",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
