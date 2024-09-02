import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magician_ai/common/wand_ui/components/select.dart';
import 'package:magician_ai/features/chat/widgets/idle_chat.dart';
import 'package:remix/remix.dart';

import '../../../common/wand_ui/components/text_field.dart';
import '../../../app/app_state.dart';

class EmptyChatView extends StatelessWidget {
  const EmptyChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    return SizedBox(
      width: 700,
      child: Column(
        children: [
          Spacer(),
          IdleChat(
            controller: IdleChatController(
              onTapTag: (tag) {
                bloc.add(
                  AppEventStartChat(
                    model: bloc.state.model!,
                    message: tag,
                  ),
                );
              },
            ),
          ),
          Spacer(),
          _TextField(),
        ],
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();

    final availableModels = bloc.listAllModels();
    return FutureBuilder<List<String>>(
      future: availableModels,
      builder: (context, value) {
        return WardTextField(
          onSubmit: (text) {
            bloc.add(
              AppEventStartChat(
                message: text,
                model: bloc.state.model ?? value.data!.first,
              ),
            );
          },
          selectController: SelectController(
            enabled: bloc.state.model == null,
            onChanged: (value) {
              bloc.add(AppEventChangeModel(model: value));
            },
            items: [
              ...(value.data ?? []).map(
                (e) => XSelectMenuItem<String>(
                  value: e,
                  child: XSelectMenuItemWidget(text: e),
                ),
              ),
            ],
            value: bloc.state.model,
          ),
        );
      },
    );
  }
}
