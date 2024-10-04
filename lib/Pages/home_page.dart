import 'package:flutter/material.dart';
import 'package:weg_ale/autho/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

void logout(){
  final _auth= AuthService();
  _auth.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            logout();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Home'),
        
      ),
    );
  }
}