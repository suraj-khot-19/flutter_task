import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new user
  Future<void> addUser(String email, String password) async {
    String uid = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password))
        .user!
        .uid;
    return _db.collection('users').doc(uid).set({'email': email});
  }

  // Update a user
  Future<void> updateUser(String uid, String email) {
    return _db.collection('users').doc(uid).update({'email': email});
  }

  // Get all users
  Stream<QuerySnapshot> getUsers() {
    return _db.collection('users').snapshots();
  }

  // Add a new character
  Future<void> addCharacter(String name) {
    return _db.collection('characters').add({'name': name, 'votes': 0});
  }

  // Update a character
  Future<void> updateCharacter(String characterId, String name) {
    return _db.collection('characters').doc(characterId).update({'name': name});
  }

  // Update character votes
  Future<void> updateCharacterVotes(String characterId) {
    return _db
        .collection('characters')
        .doc(characterId)
        .update({'votes': FieldValue.increment(1)});
  }

  // Get all characters
  Stream<QuerySnapshot> getCharacters() {
    return _db.collection('characters').snapshots();
  }

  // Get character voting data
  Stream<QuerySnapshot> getVotingData() {
    return _db.collection('votes').snapshots();
  }
}
