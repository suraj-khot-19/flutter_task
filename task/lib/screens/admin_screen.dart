import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/services/auth_service.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthService>(context, listen: false).signOut();
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Manage Users'),
            onTap: () {
              Navigator.of(context).pushNamed('/manageUsers');
            },
          ),
          ListTile(
            title: const Text('Manage Characters'),
            onTap: () {
              Navigator.of(context).pushNamed('/manageCharacters');
            },
          ),
          ListTile(
            title: const Text('View Reports'),
            onTap: () {
              Navigator.of(context).pushNamed('/reports');
            },
          ),
        ],
      ),
    );
  }
}
