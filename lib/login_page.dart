import 'package:flutter/material.dart';
import 'package:uiproject/search_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String username = "admin";
  final String password = "admin";

  void _login() {
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (enteredUsername.toLowerCase() == username.toLowerCase() &&
        enteredPassword == password) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SearchPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Invalid Credentials"),
            content: const Text("The username or password is incorrect."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

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
      body: Column(
        children: [
          Expanded(
            child: Container(
                color: Colors.pink[50],
                child: SingleChildScrollView(
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
                          controller: _usernameController,
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
                          obscureText: true,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.deepPurple,
                              hintText: 'password'),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: _login,
                          child: const Text(
                            'LogIn',
                            style: TextStyle(fontSize: 25),
                          ))
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
