enum MessageRole { user, ai, system }

class Message {
  final String content;
  final MessageRole role;

  const Message(this.content, {required this.role});

  @override
  String toString() {
    return 'Message(content: $content, role: $role)';
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'role': role.toString(),
      };
}
