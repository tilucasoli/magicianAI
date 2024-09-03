import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magician_ai/features/chat/view/chat_view.dart';
import 'package:magician_ai/app/app_state.dart';
import 'package:magician_ai/services/llm_service.dart';

import '../../../services/database_services.dart';
import '../bloc/chat_session_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final session = context.read<AppBloc>().state.activeSession!;
        final repository = context.read<ChatSessionRepository>();

        return ChatSessionBloc(
          session,
          llmService: LocalLlmServiceImpl(),
          chatSessionRepository: repository,
        );
      },
      child: ChatView(),
    );
  }
}
