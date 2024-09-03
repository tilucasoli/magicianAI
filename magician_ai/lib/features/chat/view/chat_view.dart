import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magician_ai/features/chat/widgets/idle_chat.dart';
import 'package:mix/mix.dart';

import 'package:remix/remix.dart';

import '../../../common/wand_ui/components/select.dart';
import '../../../common/wand_ui/components/text_field.dart';
import '../../../common/wand_ui/theme/tokens.dart';
import '../../../domain/entities/src/message.dart';
import '../../../app/app_state.dart';
import '../bloc/chat_session_bloc.dart';
import '../bloc/chat_session_event.dart';
import '../bloc/chat_session_state.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/messages_bar.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final controller = ScrollController();
  late List<GlobalKey> userMessagesKeys;

  void _scrollToTarget(int index) {
    final RenderObject? renderObject =
        userMessagesKeys[index].currentContext?.findRenderObject();

    if (renderObject != null) {
      controller.position.ensureVisible(
        renderObject,
        alignment: 0.05,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) =>
          previous.activeSession != current.activeSession,
      listener: (context, state) {
        if (state.activeSession != null) {
          context.read<ChatSessionBloc>().add(
                ChatSessionChangeChat(
                  chatSessionId: state.activeSession!.data.chatSessionId,
                ),
              );
        }
      },
      child: BlocBuilder<ChatSessionBloc, ChatSessionState>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 60, right: 30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 700,
                child: Stack(
                  children: [
                    if (state.data.messages.isNotEmpty) ...[
                      _ChatMessagesList(
                        state.data.messages,
                        isAITyping: state.isAITyping,
                        controller: controller,
                        callbackGlobalKeys: (keys) {
                          userMessagesKeys = keys;
                        },
                      )
                    ],
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _TextField(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ChatMessagesList extends StatefulWidget {
  const _ChatMessagesList(
    this.messages, {
    this.isAITyping = false,
    this.controller,
    required this.callbackGlobalKeys,
  });

  final List<Message> messages;
  final bool isAITyping;
  final ScrollController? controller;
  final void Function(List<GlobalKey> keys) callbackGlobalKeys;

  @override
  State<_ChatMessagesList> createState() => _ChatMessagesListState();
}

class _ChatMessagesListState extends State<_ChatMessagesList> {
  var userMessagesKeys = <GlobalKey>[];
  List<Widget> _buildMessages(List<Message> messages) {
    return messages.map((message) {
      if (message.role == MessageRole.user) {
        final key = GlobalKey();
        userMessagesKeys.add(key);
        return ChatBubble(
          key: key,
          message: message.content!,
          type: ChatBubbleType.user,
          icon: Image(
            image: AssetImage('assets/brain.png'),
            height: 24,
            width: 24,
          ),
        );
      }
      return ChatBubble(
        message: message.content!,
        type: ChatBubbleType.ai,
        icon: Image(
          image: AssetImage('assets/robot.png'),
          height: 24,
          width: 24,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.callbackGlobalKeys(userMessagesKeys);
    });
    userMessagesKeys = [];
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: widget.controller,
        padding: EdgeInsets.only(bottom: 200, top: 30),
        clipBehavior: Clip.none,
        child: VBox(
          style: Style(
            $flex.mainAxisSize.max(),
            $flex.mainAxisAlignment.start(),
            $flex.crossAxisAlignment.start(),
            $flex.gap.ref($wand.space.space8),
          ),
          children: [
            ..._buildMessages(widget.messages),
            if (widget.isAITyping) ...[
              ChatBubble(
                loading: true,
                message: '',
                type: ChatBubbleType.ai,
                icon: Image(
                  image: AssetImage('assets/robot.png'),
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatSessionBloc>();

    return WardTextField(
      onSubmit: (value) {
        bloc.add(ChatSessionEventUserSendMessage(message: value));
      },
      selectController: SelectController(
        enabled: false,
        onChanged: (value) {},
        items: [],
        value: bloc.state.data.model,
      ),
    );
  }
}
