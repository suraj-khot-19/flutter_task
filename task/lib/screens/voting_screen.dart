import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';

class VotingScreen extends StatelessWidget {
  const VotingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Character'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Provider.of<FirestoreService>(context).getCharacters(),
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
                onTap: () {
                  Provider.of<FirestoreService>(context, listen: false)
                      .updateCharacterVotes(character.id);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('Thank you for voting!'),
                      );
                    },
                  );
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.of(context).pop();
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
