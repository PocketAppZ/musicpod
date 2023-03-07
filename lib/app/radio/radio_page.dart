import 'package:flutter/material.dart';
import 'package:music/app/common/audio_page.dart';
import 'package:music/app/radio/radio_model.dart';
import 'package:music/data/audio.dart';
import 'package:music/l10n/l10n.dart';
import 'package:provider/provider.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key, this.showWindowControls = true});

  final bool showWindowControls;

  static Widget create(BuildContext context, [bool showWindowControls = true]) {
    return ChangeNotifierProvider(
      create: (_) => RadioModel()..init(),
      child: RadioPage(
        showWindowControls: showWindowControls,
      ),
    );
  }

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RadioModel>();

    return AudioPage(
      audioType: AudioType.radio,
      placeTrailer: false,
      showTrack: false,
      editableName: false,
      deletable: false,
      likePageButton: const SizedBox.shrink(),
      audios: model.stations,
      pageId: context.l10n.radio,
    );
  }
}
