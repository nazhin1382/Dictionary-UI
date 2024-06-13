import 'package:flutter/material.dart';
import 'package:uiproject/favorite.dart';

class MeaningPage extends StatefulWidget {
  const MeaningPage({super.key});

  @override
  State<MeaningPage> createState() => _MeaningPageState();
}

class _MeaningPageState extends State<MeaningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Searched word',
          style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 60, 37, 99)),
        ),
        backgroundColor: Colors.blue[100],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite()),
              );
            },
            icon: const Icon(Icons.star),
            color: const Color.fromARGB(255, 85, 66, 118),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.history_rounded),
            color: const Color.fromARGB(255, 53, 53, 53),
          )
        ],
      ),
      body: Expanded(
        child: Container(
          color: const Color.fromARGB(255, 231, 242, 251),
        ),
      ),
    );
  }
}
