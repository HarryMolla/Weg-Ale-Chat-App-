import 'package:flutter/material.dart';

class MyTextfiled extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  
    const MyTextfiled({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller
    });
    
  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            Center(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).colorScheme.tertiary),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.circular(5))),
              ),
              
            ),
            const SizedBox(height: 10,)
          ],
        );
        
      
    
  }
}
