// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../locator.dart';
import '../../services/camera.service.dart';
import '../models/user.model.dart';
import '../profile.dart';
import 'app_button.dart';
import 'app_text_field.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.user}) : super(key: key);
  final User user;

  final _passwordController = TextEditingController();
  final _cameraService = GetIt.instance<CameraService>();

  Future _signIn(context, user) async {
    if (user.password == _passwordController.text) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Profile(
                    user.user,
                    imagePath: _cameraService.imagePath!,
                  )));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Wrong password!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Welcome back, ${user.user}.',
            style: const TextStyle(fontSize: 20),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              AppTextField(
                controller: _passwordController,
                labelText: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              AppButton(
                text: 'LOGIN',
                onPressed: () async {
                  _signIn(context, user);
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
