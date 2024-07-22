import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';

class ManageCharactersScreen extends StatelessWidget {
  const ManageCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Characters'),
      ),
      body: StreamBuilder(
        stream: firestoreService.getCharacters(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var characters = snapshot.data!.docs;
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              var character = characters[index];
              return ListTile(
                title: Text(character['name']),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditCharacterDialog(
                        context, firestoreService, character);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddCharacterDialog(context, firestoreService);
        },
      ),
    );
  }

  void _showAddCharacterDialog(
      BuildContext context, FirestoreService firestoreService) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Character'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                firestoreService.addCharacter(nameController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditCharacterDialog(BuildContext context,
      FirestoreService firestoreService, DocumentSnapshot character) {
    final nameController = TextEditingController(text: character['name']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Character'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                firestoreService.updateCharacter(
                    character.id, nameController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
