import 'package:flutter/material.dart';
import 'package:uiproject/models/word.dart';
import 'package:uiproject/search_page.dart';
import 'package:uiproject/WordMeaning.dart';
import 'package:uiproject/myfavorites.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<Word> _wordlist = [
    Word(
        turkish: 'merhaba',
        english: 'hello',
        image: 'lib/Image/helloimage.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 71, 79, 29)),
        ),
        backgroundColor: const Color.fromARGB(255, 210, 241, 192),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(Icons.home),
            color: const Color.fromARGB(255, 10, 73, 53),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.history_rounded),
            color: const Color.fromARGB(255, 10, 73, 53),
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 214, 251, 216),
        child: ListView.builder(
          itemCount: _wordlist.length,
          itemBuilder: (context, index) {
            final wordInfo = _wordlist[index];
            return const MyFavorites(
              favorites: [],
            );
          },
        ),
      ),
    );
  }
}
