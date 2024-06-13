import 'package:flutter/material.dart';
import 'package:uiproject/SearchPage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController __password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'LOG IN',
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 60, 37, 99)),
          ),
          backgroundColor: Colors.pink[100],
        ),
        body: Column(children: [
          Expanded(
            child: Container(
                color: Colors.pink[50],
                height: 250,
                width: 500,
                child: Column(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 200,
                      color: Colors.deepPurple,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                      child: TextField(
                        scrollPadding: const EdgeInsets.all(20),
                        controller: _username,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.deepPurple,
                            hintText: 'username'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 8, 40, 8),
                      child: TextField(
                        controller: __password,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.deepPurple,
                            hintText: 'password'),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()),
                          );
                        },
                        child: const Text(
                          'LogIn',
                          style: TextStyle(fontSize: 25),
                        ))
                  ],
                )),
          ),
          const SizedBox(
            height: 10,
          ),
        ]));
  }
}
