import 'package:flutter/material.dart';

import 'item.dart';
import 'globalItems.dart';

class EditItemPage extends StatefulWidget {
  final Item item;

  const EditItemPage({Key? key, required this.item}) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState(item);
}

class _EditItemPageState extends State<EditItemPage> {
  _EditItemPageState(item);

  late Item item = widget.item;

  //create controllers for text fields
  TextEditingController itemNameController = TextEditingController(); //name
  TextEditingController itemDescriptionController =
      TextEditingController(); //description

  @override
  void initState() {
    super.initState();

    //set text of controller to item's name
    itemNameController.text = item.name;
    //set text of controller to item's description
    itemDescriptionController.text = item.description;
  }

  //this method handles the logic for when the update item button is pressed
  void _updateItemPressed() {
    //set currentItem to hold the item at the current index
    Item currentItem =
        GlobalItems.items.firstWhere((index) => index.id == item.id);
    //change item's fields to match text field entries
    currentItem.name = itemNameController.text;
    currentItem.description = itemDescriptionController.text;

    //pop page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Edit Item"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: itemNameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: itemDescriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            ElevatedButton(
              onPressed: _updateItemPressed,
              child: const Text("Update Item"),
            )
          ],
        )));
  }
}
