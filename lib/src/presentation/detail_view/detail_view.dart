import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/provider/presentation_provider.dart';

class DetailView extends ConsumerWidget {
  static const String path = '/char';

  final int _charId;

  const DetailView(this._charId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(detailScreenModel.create(_charId));
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              flex: 1, child: Image.network(model.image, fit: BoxFit.contain)),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Text(model.location),
                Text(model.origin),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
