import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:golang_kbtu_flutter_frontend/controllers/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Obx(
            () {
              return controller.isLogged.value
                  ? Column(
                      children: [
                        Text(controller.email.value),
                        ElevatedButton(
                          onPressed: () {
                            controller.logout();
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    )
                  : Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                            onChanged: (str) => controller.email.value = str,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            onChanged: (str) => controller.password.value = str,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.login();
                                  },
                                  child: const Text('Login'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.register();
                                  },
                                  child: const Text('Register'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
