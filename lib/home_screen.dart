import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(builder: (_) => const HomeScreen());
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: const Text(
              '4',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          ExpansionTile(
            title: Text("What is Flutter?"),
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Flutter is an open source UI framework for creating native mobile applications. It allows developers to build mobile applications a single codebase"),
                ),
                trailing: SizedBox(
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 400,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Stateful widgets?"),
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "The widget whose state can be altered in mobile applications is called stateful widget"),
                ),
                trailing: SizedBox(
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 400,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Conditional(ternary)operator"),
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "The Conditional(ternary) operator in Dart takes three operands:a condition(if) and second expresion(if falsy)"),
                ),
                trailing: SizedBox(
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 400,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text("What is Flutter?"),
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Flutter is an open source UI framework for creating native mobile applications. It allows developers to build mobile applications a single codebase"),
                ),
                trailing: SizedBox(
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 400,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.menu),
              tooltip: 'Show less. Hide notes content',
              onPressed: () {}),

          /* Notes: for the "Show More" icon use: Icons.menu */

          FloatingActionButton(
            child: const Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
