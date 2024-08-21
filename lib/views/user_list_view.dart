import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            iconSize: 35,
            color: Colors.black,
            onPressed: () {
              userViewModel.loadUsers();
            },
          ),
        ],
      ),
      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
              ),
            );
          }

          if (viewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Error: ${viewModel.errorMessage}',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: viewModel.users.length,
              itemBuilder: (context, index) {
                final user = viewModel.users[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurpleAccent,
                      child: Text(
                        user.name[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      // Handle tap event if needed
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
