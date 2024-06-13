import 'package:flutter/material.dart';
import 'package:uiproject/models/word.dart';

class MyFavorites extends StatelessWidget {
  final List<Word> favorites;

  const MyFavorites({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites '),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final wordInfo = favorites[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color.fromARGB(255, 115, 175, 117),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(favorites[index].english),
                          Text(favorites[index].turkish),
                        ],
                      ),
                      Container(
                        child: favorites[index].image != null
                            ? Image.asset(
                                favorites[index].image!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : const Text('there is no /n image for this word'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset('assets/meaning_icon.png',
                        width: 24, height: 24),
                    const SizedBox(width: 8),
                  ],
                ),
                // Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
