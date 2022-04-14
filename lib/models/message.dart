class Message {
  String? id;
  String description;
  DateTime date;
  String authorUserId;
  String authorUserName;
  Message({
    this.id,
    required this.description,
    required this.date,
    required this.authorUserId,
    required this.authorUserName,
  });
  factory Message.fromMap(Map map) => Message(
        id: map['id'],
        description: map['description'],
        date: map['date'],
        authorUserId: map['authorUserId'],
        authorUserName: map['authorUserName'],
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'authorUserId': authorUserId,
      'authorUserName': authorUserName,
      'description': description
    };
  }
}
