import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/idea.dart';
import 'idea_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String age;
  final String email;
  final String gender;
  final String avatar;

  HomeScreen({
    required this.name,
    required this.age,
    required this.email,
    required this.gender,
    required this.avatar,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = Hive.box('ideas');

  List<Idea> getIdeas() {
    return box.values
        .map((e) => Idea.fromMap(Map<String, dynamic>.from(e)))
        .toList();
  }

  List<Color> pastelColors = [
    Colors.orange.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.purple.shade100,
    Colors.pink.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    final ideas = getIdeas();

    return Scaffold(
      backgroundColor: Colors.grey[100],

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                child: Text(widget.avatar, style: TextStyle(fontSize: 24)),
              ),
            ),

            ListTile(
              leading: Icon(Icons.grid_view),
              title: Text("All Ideas"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favorites"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          "All Ideas",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(
                      name: widget.name,
                      age: widget.age,
                      email: widget.email,
                      gender: widget.gender,
                      avatar: widget.avatar,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                child: Text(widget.avatar),
              ),
            ),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(12),
        child: ideas.isEmpty
            ? Center(child: Text("No Ideas Yet 💡"))
            : MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: ideas.length,
          itemBuilder: (context, index) {
            final idea = ideas[index];

            return GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => IdeaScreen(
                      idea: idea,
                      index: index,
                    ),
                  ),
                );
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: pastelColors[index % pastelColors.length],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      idea.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),

                    ...idea.items.take(3).map((e) => Text("• $e")),

                    if (idea.isFavorite)
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.star, color: Colors.orange),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => IdeaScreen(),
            ),
          );
          setState(() {});
        },
      ),
    );
  }
}