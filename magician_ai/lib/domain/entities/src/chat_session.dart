import 'package:isar/isar.dart';
import '../entities.dart';

part 'chat_session.g.dart';

@collection
final class ChatSession {
  final List<Message> messages;
  final String? model;
  final String? title;
  @Index(unique: true)
  final String chatSessionId;
  final Id id = Isar.autoIncrement;

  ChatSession({
    required this.chatSessionId,
    required this.messages,
    this.model,
    this.title,
  });

  ChatSession copyWith({
    List<Message>? messages,
    String? model,
    String? title,
  }) {
    return ChatSession(
      messages: messages ?? this.messages,
      model: model ?? this.model,
      title: title ?? this.title,
      chatSessionId: chatSessionId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatSessionId': chatSessionId,
      'messages': messages.map((message) => message.toJson()).toList(),
      'model': model,
      'title': title,
    };
  }
}
