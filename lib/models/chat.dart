class Chat {
  String name;
  Chat({
    required this.name,
  });
  factory Chat.fromJson(Map map) => Chat(
        name: map['name'],
      );
}
