import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Ink(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(5)
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
           alignment: const Alignment(0, 0),
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(text, style: const TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
