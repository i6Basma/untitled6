import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: "Name")), // [cite: 31]
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")), // [cite: 32]
            TextField(controller: messageController, decoration: const InputDecoration(labelText: "Message"), maxLines: 3), // [cite: 33]
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // إظهار السناك بار المطلوب [cite: 34, 35]
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Form Submitted Successfully")));
              },
              child: const Text("Send"), // [cite: 34]
            ),
          ],
        ),
      ),
    );
  }
}