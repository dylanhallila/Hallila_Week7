import 'package:flutter/material.dart';
import 'item.dart';
import 'globalItems.dart';
import 'editItemPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 225, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hallila Week 7'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //create local list from global list
  List<Item> localItems = GlobalItems.items;

  //this method handles the logic when the delete button is pressed for an item
  void _deleteButtonPressed(Item item) {
    //the item is passed in and removed from both lists
    localItems.remove(item);
    GlobalItems.items.remove(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: localItems.map((item) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    EditItemPage(item: item))))
                        .then(((value) => {setState(() {})}));
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID: " + item.id.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Name: " + item.name,
                              style: const TextStyle(fontSize: 18)),
                          Text("Description: " + item.description,
                              style: const TextStyle(fontSize: 18)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white),
                              onPressed: () => {
                                    setState(() {
                                      _deleteButtonPressed(item);
                                    })
                                  },
                              child: const Text("Delete")),
                          const Divider(),
                        ])));
          }).toList(),
        )),
      ),
    );
  }
}
