import 'package:flutter/material.dart';
import 'package:uiproject/favorite.dart';
import 'package:uiproject/meaning_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dictionary',
          style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 60, 37, 99)),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 231, 245),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: 800,
            color: Colors.blue,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'lib/Image/searchpagephoto.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 243, 231, 245),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hoverColor: Colors.deepPurpleAccent,
                        fillColor: Colors.deepPurple,
                        hintText: 'search a word',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MeaningPage()),
                        );
                      },
                      icon: const Icon(Icons.search)),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 243, 231, 245),
            ),
          )
        ],
      ),
    );
  }
}
