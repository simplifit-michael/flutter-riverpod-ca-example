import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/provider/presentation_provider.dart';
import 'package:ricknmorty/src/presentation/detail_view/detail_view.dart';

import 'main_view_model.dart';

class MainView extends ConsumerWidget {
  static const String path = '/';

  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(mainScreenModel);
    return Scaffold(
      appBar: AppBar(title: const Text('Character List')),
      body: RefreshIndicator(
        onRefresh: model.updateCharacters,
        child: buildBody(model),
      ),
    );
  }
}

Widget buildBody(MainViewModel model) {
  if (model.isBusy) {
    return const Center(child: CircularProgressIndicator.adaptive());
  } else {
    if (model.characters.isEmpty) {
      return const Center(child: Text('No Characters Available'));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final current = model.characters[index];

          return ListTile(
            title: Text(current.name),
            onTap: () => Navigator.of(context).pushNamed(
              DetailView.path,
              arguments: current.id,
            ),
          );
        },
        itemCount: model.characters.length,
      );
    }
  }
}
