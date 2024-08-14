import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:magician_ai/presentation/chat/states/chat_state.dart';
import 'package:magician_ai/presentation/chat/widgets/chat_bubble.dart';
import 'package:mix/mix.dart';

import '../../common/wand_ui/components/text_field.dart';
import '../../common/wand_ui/theme/tokens.dart';

import '../../domain/entities/entities.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Widget> _buildMessages(List<Message> messages) {
    return messages
        .map((message) => message.role == MessageRole.user
            ? ChatBubble(
                message: message.content,
                type: ChatBubbleType.user,
                icon: Image(
                  image: AssetImage('assets/brain.png'),
                  height: 24,
                  width: 24,
                ),
              )
            : ChatBubble(
                message: message.content,
                type: ChatBubbleType.ai,
                icon: Image(
                  image: AssetImage('assets/robot.png'),
                  height: 24,
                  width: 24,
                ),
              ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final chatState = ref.watch(chatStateProvider);
        final chatStateNotifier = ref.read(chatStateProvider.notifier);

        return ZBox(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 200, top: 40),
              child: VBox(
                style: Style(
                  $flex.mainAxisSize.max(),
                  $flex.mainAxisAlignment.start(),
                  $flex.crossAxisAlignment.start(),
                  $flex.gap.ref($wand.space.space8),
                ),
                children: [
                  if (chatStateNotifier.cachedMessages.isEmpty) ...[
                    Center(
                      child: StyledText(
                        'Hello! How can I help you?',
                        style: Style(
                          $text.style.ref($wand.text.regular16),
                          $text.style.color.ref($wand.color.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
              child: WardTextField(
                onSubmit: (value) {
                  chatStateNotifier.generateResponse(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
