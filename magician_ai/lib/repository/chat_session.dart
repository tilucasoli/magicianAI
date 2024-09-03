import 'package:isar/isar.dart';
import 'package:magician_ai/domain/domain.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/entities/src/chat_session.dart';

abstract class ChatSessionRepository {
  Future<List<ChatSession>> loadAllChatSessions();
  Future<ChatSession?> loadChatSession(String chatSessionId);
  Future<void> createNewChatSession({
    required String id,
    required String title,
    required String model,
    required String message,
  });
  Future<void> deleteChatSession({required String chatSessionId});
  Future<void> saveChatSession(ChatSession chatSession);
  Future<void> deleteAll();
}

class ChatSessionRepositoryImpl implements ChatSessionRepository {
  late Future<Isar> _db;

  ChatSessionRepositoryImpl() {
    _db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ChatSessionSchema], directory: dir.path);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<ChatSession>> loadAllChatSessions() async {
    final Isar dbInstance = await _db;
    final chatSessions =
        await dbInstance.chatSessions.where().sortByChatSessionId().findAll();
    return chatSessions;
  }

  @override
  Future<ChatSession?> loadChatSession(String chatSessionId) async {
    final Isar dbInstance = await _db;
    final chatSessions = await dbInstance.chatSessions
        .filter()
        .chatSessionIdEqualTo(chatSessionId)
        .findFirst();
    return chatSessions;
  }

  Future<void> createNewChatSession({
    required String id,
    required String title,
    required String model,
    required String message,
  }) async {
    final Isar dbInstance = await _db;
    final messageObj = Message()
      ..content = message
      ..role = MessageRole.user;

    final chatSession = ChatSession(
      chatSessionId: id,
      title: title,
      model: model,
      messages: [messageObj],
    );

    await dbInstance.writeTxn(() async {
      await dbInstance.chatSessions.put(chatSession);
    });
  }

  Future<void> deleteChatSession({required String chatSessionId}) async {
    final Isar dbInstance = await _db;
    final ChatSession? todo = await dbInstance.chatSessions
        .filter()
        .chatSessionIdEqualTo(chatSessionId)
        .findFirst();
    if (todo != null) {
      await dbInstance.writeTxn(() async {
        await dbInstance.chatSessions.delete(todo.id);
      });
    }
  }

  @override
  Future<void> saveChatSession(ChatSession chatSession) async {
    final Isar dbInstance = await _db;
    return dbInstance.writeTxn(() async {
      await dbInstance.chatSessions.putByChatSessionId(chatSession);
    });
  }

  @override
  Future<void> deleteAll() async {
    final Isar dbInstance = await _db;
    return dbInstance.writeTxn(() async {
      await dbInstance.chatSessions.clear();
    });
  }
}
