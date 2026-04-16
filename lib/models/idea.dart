class Idea {
  String title;
  List<String> items;
  bool isChecklist;
  bool isFavorite;
  int color;

  Idea({
    required this.title,
    required this.items,
    required this.isChecklist,
    required this.isFavorite,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'items': items,
      'isChecklist': isChecklist,
      'isFavorite': isFavorite,
      'color': color,
    };
  }

  factory Idea.fromMap(Map map) {
    return Idea(
      title: map['title'],
      items: List<String>.from(map['items']),
      isChecklist: map['isChecklist'],
      isFavorite: map['isFavorite'],
      color: map['color'],
    );
  }
}