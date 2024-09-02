import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magician_ai/features/chat/view/chat_page.dart';
import 'package:magician_ai/features/chat/widgets/idle_chat.dart';
import 'package:magician_ai/app/app_state.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../common/wand_ui/components/button.dart';
import '../common/wand_ui/theme/theme.dart';
import '../common/wand_ui/theme/tokens.dart';
import '../features/empty/view/empty_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: RemixTheme(
        tokens: light,
        components: RemixComponentTheme.base(),
        child: MixTheme(
          data: WandTheme().lightTheme,
          child: NewWidget(),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AppBloc>(context);
    return Scaffold(
      backgroundColor: $wand.color.black.resolve(context),
      body: Row(
        children: [
          VBox(
            style: Style(
              $box.width(250),
              $box.padding.top(40),
              $box.padding.horizontal(20),
              $box.color.ref($wand.color.white(6)),
            ),
            children: [
              SizedBox(
                width: double.infinity,
                child: WandButton.primary(
                  label: 'Start a new Chat',
                  onPressed: () {
                    bloc.add(AppEventNewChat());
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.white12,
              ),
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      for (final session in state.sessions) ...[
                        ChatOption(
                          text: session.data.title ?? 'IDONTKNOW',
                          isSelected: session == state.activeSession,
                          onPress: () {
                            bloc.add(
                                AppEventSelectChat(chatId: session.data.key));
                          },
                        ),
                      ]
                    ],
                  );
                },
              ),
            ],
          ),
          Spacer(),
          Center(child: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return state.activeSession == null ? EmptyChatView() : ChatPage();
            },
          )),
          Spacer(),
        ],
      ),
    );
  }
}

class ChatOption extends StatelessWidget {
  const ChatOption({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPress,
  });

  final String text;
  final void Function()? onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPress: onPress,
      style: Style(
        $box.width.infinity(),
        $box.padding.all.ref($wand.space.space2),
        $box.color.transparent(),
        $box.borderRadius.all.ref($wand.radius.radius2),
        $text.style.color.ref($wand.color.white(3)),
        $text.style.ref($wand.text.regular14),
        $text.maxLines(2),
        $text.overflow.ellipsis(),
        $on.hover(
          $box.padding.horizontal.ref($wand.space.space2),
          $box.color.ref($wand.color.white(6)),
          $text.style.color.ref($wand.color.white(2)),
        ),
        isSelected ? $text.style.color.ref($wand.color.white()) : null,
        isSelected ? $box.padding.left.ref($wand.space.space2) : null,
      ).animate(
        duration: Durations.short2,
      ),
      child: StyledText(text),
    );
  }
}