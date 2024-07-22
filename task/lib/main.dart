import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/firebase_options.dart';
import 'package:task/screens/admin_screen.dart';
import 'package:task/screens/manage_characters.dart';
import 'package:task/screens/manage_users_screen.dart';
import 'package:task/screens/report_screen.dart';
import 'package:task/screens/voting_screen.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/services/firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<FirestoreService>(create: (_) => FirestoreService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const VotingScreen(),
        routes: {
          '/admin': (context) => const AdminScreen(),
          '/manageUsers': (context) => const ManageUsersScreen(),
          '/manageCharacters': (context) => const ManageCharactersScreen(),
          '/reports': (context) => const ReportScreen(),
        },
      ),
    );
  }
}
