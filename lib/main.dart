import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BiodataPage()));
}

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final contactCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final schoolCtrl = TextEditingController();
  final courseCtrl = TextEditingController();

  void save() {
    if (nameCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Your Biodata'),
        content: Text(
          'Name: ${nameCtrl.text.trim()}\n'
          'Age: ${ageCtrl.text.trim()}\n'
          'Address: ${addressCtrl.text.trim()}\n'
          'Contact: ${contactCtrl.text.trim()}\n'
          'Email: ${emailCtrl.text.trim()}\n'
          'School: ${schoolCtrl.text.trim()}\n'
          'Course: ${courseCtrl.text.trim()}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biodata')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: ageCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Age'),
          ),
          TextField(
            controller: addressCtrl,
            decoration: const InputDecoration(labelText: 'Address'),
          ),
          TextField(
            controller: contactCtrl,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Contact Number'),
          ),
          TextField(
            controller: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: schoolCtrl,
            decoration: const InputDecoration(labelText: 'School'),
          ),
          TextField(
            controller: courseCtrl,
            decoration: const InputDecoration(labelText: 'Course'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: save,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}