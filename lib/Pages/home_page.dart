import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weg_ale/Pages/chat_page.dart';
import 'package:weg_ale/components/my_drawer.dart';
import 'package:weg_ale/components/user_tile.dart';
import 'package:weg_ale/services/autho/auth_service.dart';
import 'package:weg_ale/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

   User? getCurrentUserEmail() {
    return _authService.getCurrentUser();
  }


  //chat and auth service
  final ChatService _chatService=ChatService();
  final AuthService _authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text('Home'),
        centerTitle: true,
      ),
    drawer: const MyDrawer(),
     body: Column(
        children: [
          Expanded(
              child: _buildUserList(),
          ),
          // Bottom Container
          Container(
            decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
             boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  offset: const Offset(0, 0), // Position of the shadow
                  blurRadius: 15, // Blur effect
                ),
              ],
            ),
            height: 100, // Adjust height as needed
            child: Center(
              child: GestureDetector(
                onTap: (){},
                child: const Text(
                  'Talk to Stranger',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  
  }
  //build a list of user
  Widget _buildUserList (){
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snaphot){
        //erro
        if (snaphot.hasError) {
          return const Text('Error');
        }
        //loading
        if (snaphot.connectionState==ConnectionState.waiting) {
          return const Text('Loading...');
        }
        // return list view
        return ListView(
          children: snaphot.data!.map<Widget>((userData)=>_buildUserListItem(userData, context)).toList(),

        );
      }
      );
  }
  
  //build individual list tail for user
 Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  final currentUserEmail = _authService.getCurrentUser()?.email;

  // Log the current user email for debugging

  if (currentUserEmail != null && userData['email'].toLowerCase() != currentUserEmail.toLowerCase()) {
    return UserTile(
      text: userData['email'],
      onTap: (){
        //tap on user --> go to chat page
        Navigator.push(context, MaterialPageRoute
        (builder: (context)=>ChatPage(
            reseverEmail: userData['email'],
            reseverID: userData['uid'],
          )
        ));

      }
    );
   }else{
    return Container();
   }
  }
}
