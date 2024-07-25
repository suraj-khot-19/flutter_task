import 'package:flutter/material.dart';
import 'package:task/screens/admin/admin_register.dart';
import 'package:task/widgets/my_button.dart';
import 'package:task/widgets/my_spacer.dart';

import 'package:task/widgets/my_text_feild.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  void dispose() {
    emailController.clear();
    passController.clear();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  bool isObsecure1 = true;
  void onTap() {
    setState(() {
      isObsecure1 = !isObsecure1;
    });
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFeild(
                  hintText: "email",
                  controller: emailController,
                ),
                verticleSpace(10),
                MyTextFeild(
                  hintText: "password",
                  controller: passController,
                  isObsecure: isObsecure1,
                  isPassword: true,
                  onTap: onTap,
                ),
                verticleSpace(20),
                const MyButton(title: "Login"),
                verticleSpace(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    horizontalSpace(8),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const AdminRegister();
                        }));
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
