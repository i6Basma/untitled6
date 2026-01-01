import 'package:flutter/material.dart';
import 'products_list_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(controller: emailController, decoration: const InputDecoration(labelText: "Email")), // [cite: 16]
            TextFormField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: "Password")), // [cite: 17]
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // الانتقال إلى قائمة المنتجات [cite: 19]
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsListScreen()));
              },
              child: const Text("Login"), // [cite: 18]
            ),
          ],
        ),
      ),
    );
  }
}