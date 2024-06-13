import 'package:flutter/material.dart';
import 'package:uiproject/models/word.dart';
import 'package:uiproject/search_page.dart';
import 'package:uiproject/WordMeaning.dart';
import 'package:uiproject/myfavorites.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
          'Favorites',
          style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 29, 79, 43)),
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
