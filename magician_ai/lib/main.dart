import 'package:flutter/material.dart';
import 'package:magician_ai/common/wand_ui/theme/theme.dart';
import 'package:mix/mix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/wand_ui/theme/tokens.dart';
import 'presentation/chat/chat_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: WandTheme().lightTheme,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: NewWidget(),
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
    return Scaffold(
      backgroundColor: $wand.color.black.resolve(context),
      body: Center(
        child: SizedBox(
          width: 700,
          child: ChatScreen(),
        ),
      ),
    );
  }
}
