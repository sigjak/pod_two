import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SliderBar extends StatefulWidget {
  SliderBar(this._audioPlayer);
  final AudioPlayer _audioPlayer;
  @override
  _SliderBarState createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  String formatDur(Duration d) {
    return (d.toString().split('.').first.padLeft(8, '0'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: StreamBuilder<Duration?>(
              stream: widget._audioPlayer.durationStream,
              builder: (context, snapshot) {
                final duration = snapshot.data ?? Duration.zero;
                return StreamBuilder<Duration?>(
                    stream: widget._audioPlayer.positionStream,
                    builder: (context, snapshot2) {
                      final position = snapshot2.data ?? Duration.zero;
                      return Text(
                          '${formatDur(position)} --- ${formatDur(duration)}');
                    });
              }),
        )
      ],
    );
  }
}
