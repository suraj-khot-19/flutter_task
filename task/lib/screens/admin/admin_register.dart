import 'package:flutter/material.dart';
import 'package:task/screens/admin/admin_login.dart';

import 'package:task/widgets/my_button.dart';
import 'package:task/widgets/my_spacer.dart';
import 'package:task/widgets/my_text_feild.dart';

class AdminRegister extends StatefulWidget {
  const AdminRegister({super.key});

  @override
  State<AdminRegister> createState() => _AdminRegisterState();
}

class _AdminRegisterState extends State<AdminRegister> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  void dispose() {
    emailController.clear();
    passController.clear();
    confirmPassController.clear();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  bool isObsecure1 = true;
  bool isObsecure2 = true;
  void onTap1() {
    setState(() {
      isObsecure1 = !isObsecure1;
    });
  }

  void onTap2() {
    setState(() {
      isObsecure2 = !isObsecure2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFeild(hintText: "email", controller: emailController),
                verticleSpace(10),
                MyTextFeild(
                  hintText: "password",
                  controller: passController,
                  isObsecure: isObsecure1,
                  isPassword: true,
                  onTap: onTap1,
                ),
                verticleSpace(10),
                MyTextFeild(
                  hintText: "confirm password",
                  controller: confirmPassController,
                  isObsecure: isObsecure2,
                  isPassword: true,
                  onTap: onTap2,
                ),
                verticleSpace(15),
                const MyButton(title: "Regiser"),
                verticleSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already ave an account?"),
                    horizontalSpace(5),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const AdminLogin();
                        }));
                      },
                      child: const Text(
                        'Login Now',
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
