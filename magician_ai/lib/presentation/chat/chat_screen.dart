import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magician_ai/presentation/chat/states/chat_state.dart';
import 'package:magician_ai/presentation/chat/widgets/chat_bubble.dart';
import 'package:magician_ai/presentation/chat/widgets/messages_bar.dart';
import 'package:mix/mix.dart';

import '../../common/wand_ui/components/text_field.dart';
import '../../common/wand_ui/theme/tokens.dart';

import '../../domain/entities/entities.dart';
import 'widgets/idle_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = ScrollController();

  var userMessagesKeys = <GlobalKey>[];

  List<Widget> _buildMessages(List<Message> messages) {
    return messages.map((message) {
      if (message.role == MessageRole.user) {
        final key = GlobalKey();
        userMessagesKeys.add(key);
        return ChatBubble(
          key: key,
          message: message.content,
          type: ChatBubbleType.user,
          icon: Image(
            image: AssetImage('assets/brain.png'),
            height: 24,
            width: 24,
          ),
        );
      }
      return ChatBubble(
        message: message.content,
        type: ChatBubbleType.ai,
        icon: Image(
          image: AssetImage('assets/robot.png'),
          height: 24,
          width: 24,
        ),
      );
    }).toList();
  }

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
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        userMessagesKeys = [];
        final chatState = ref.watch(chatStateProvider);
        final chatStateNotifier = ref.read(chatStateProvider.notifier);

        return ZBox(
          style: Style(
            $stack.alignment.topCenter(),
          ),
          children: [
            SingleChildScrollView(
              controller: controller,
              padding: EdgeInsets.only(bottom: 200, top: 40),
              clipBehavior: Clip.none,
              child: VBox(
                style: Style(
                  $flex.mainAxisSize.max(),
                  $flex.mainAxisAlignment.start(),
                  $flex.crossAxisAlignment.start(),
                  $flex.gap.ref($wand.space.space8),
                  $with.sizedBox.width(700),
                ),
                children: [
                  if (chatStateNotifier.cachedMessages.isEmpty) ...[
                    IdleChat(
                      controller: IdleChatController(
                        handleTapOnTag: (tag) {
                          chatStateNotifier.generateResponse(tag);
                        },
                      ),
                    ),
                  ],
                  ...chatState.when<List<Widget>>(
                    data: (messages) {
                      return _buildMessages(messages);
                    },
                    error: (error, stackTrace) => [Text(error.toString())],
                    loading: () => [
                      ..._buildMessages(chatStateNotifier.cachedMessages),
                      ChatBubble(
                        message: '',
                        loading: true,
                        type: ChatBubbleType.ai,
                        icon: Image(
                          image: AssetImage('assets/brain.png'),
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 700,
                child: WardTextField(
                  onSubmit: (value) {
                    chatStateNotifier.generateResponse(value);
                  },
                ),
              ),
            ),
            if (chatStateNotifier.cachedMessages.isNotEmpty) ...[
              MessagesBar(
                messages: chatStateNotifier.cachedMessages
                    .where((e) => e.role == MessageRole.user)
                    .map((e) => e.content)
                    .toList(),
                onTap: (int value) {
                  _scrollToTarget(value);
                },
              )
            ],
          ],
        );
      },
    );
  }
}
