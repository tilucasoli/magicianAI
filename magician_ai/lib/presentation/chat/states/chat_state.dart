import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magician_ai/domain/use_cases/src/generate_response_usecase.dart';

import '../../../domain/entities/entities.dart';

final chatStateProvider = AsyncNotifierProvider<ChatState, List<Message>>(
  () => ChatState(),
);

class ChatState extends AsyncNotifier<List<Message>> {
  @override
  FutureOr<List<Message>> build() => [];

  void generateResponse(String message) async {
    cachedMessages.add(Message(message, role: MessageRole.user));

    state = const AsyncValue.loading();

    final messages = <Message>[
      ...state.value ?? [],
      Message(message, role: MessageRole.user),
      await ref.read(generateResponseUseCase).execute(message),
    ];

    state = AsyncValue.data(messages);
    _cache = [...messages];
  }

  List<Message> get cachedMessages => _cache;
  List<Message> _cache = [];
}
