import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/idea.dart';

class IdeaScreen extends StatefulWidget {
  final Idea? idea;
  final int? index;

  IdeaScreen({this.idea, this.index});

  @override
  _IdeaScreenState createState() => _IdeaScreenState();
}

class _IdeaScreenState extends State<IdeaScreen> {
  final titleController = TextEditingController();
  final itemController = TextEditingController();

  List<String> items = [];
  bool isChecklist = false;
  bool isFavorite = false;

  final box = Hive.box('ideas');

  @override
  void initState() {
    super.initState();

    if (widget.idea != null) {
      titleController.text = widget.idea!.title;
      items = List.from(widget.idea!.items);
      isChecklist = widget.idea!.isChecklist;
      isFavorite = widget.idea!.isFavorite;
    }
  }

  void saveIdea() {
    final idea = Idea(
      title: titleController.text,
      items: items,
      isChecklist: isChecklist,
      isFavorite: isFavorite,
      color: Colors.orange.value,
    );

    if (widget.index != null) {
      box.putAt(widget.index!, idea.toMap());
    } else {
      box.add(idea.toMap());
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Idea"),
        actions: [
          IconButton(
            icon: Icon(
                isFavorite ? Icons.star : Icons.star_border),
            onPressed: () {
              setState(() => isFavorite = !isFavorite);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),

            TextField(
              controller: itemController,
              decoration: InputDecoration(labelText: "Add Item"),
              onSubmitted: (val) {
                setState(() {
                  items.add(val);
                  itemController.clear();
                });
              },
            ),

            SwitchListTile(
              title: Text("Checklist Mode"),
              value: isChecklist,
              onChanged: (val) {
                setState(() => isChecklist = val);
              },
            ),

            Expanded(
              child: ListView(
                children: items
                    .map((e) => ListTile(
                  leading: isChecklist
                      ? Checkbox(value: false, onChanged: (_) {})
                      : null,
                  title: Text(e),
                ))
                    .toList(),
              ),
            ),

            ElevatedButton(
              onPressed: saveIdea,
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}