enum MessageRole { user, ai, system }

class Message {
  final String content;
  final MessageRole role;

  const Message(this.content, {required this.role});
}
