import 'package:isar/isar.dart';
part 'message.g.dart';

enum MessageRole { user, ai, system }

@embedded
class Message {
  String? content;
  @enumerated
  MessageRole role = MessageRole.user;

  @override
  String toString() {
    return 'Message(content: $content, role: $role)';
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'role': role.toString(),
      };
}
