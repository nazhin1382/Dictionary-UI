import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddWord extends StatefulWidget {
  const AddWord({super.key});

  @override
  State<AddWord> createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final turkishController = TextEditingController();
  final englishController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  final bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Word"),
        backgroundColor: Color.fromARGB(255, 185, 183, 234),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
        ],
      ),
      body: Expanded(
        child: Container(
          color: Color.fromARGB(255, 226, 225, 247),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: turkishController,
                  decoration: const InputDecoration(
                      labelText: "Turkish",
                      border: OutlineInputBorder(),
                      fillColor: Color.fromARGB(255, 97, 76, 175)),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: englishController,
                  decoration: const InputDecoration(
                      labelText: "English",
                      border: OutlineInputBorder(),
                      fillColor: Color.fromARGB(255, 97, 76, 175)),
                ),
                const SizedBox(height: 20),
                _image == null
                    ? const Text("No image selected.")
                    : Image.file(_image!, height: 200, width: 200),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Pick Image"),
                ),
                const SizedBox(height: 20),
                _isSubmitting
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add Word"),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
