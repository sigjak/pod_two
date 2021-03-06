import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../screens/commons/player_buttons.dart';

class AudioScreen extends StatefulWidget {
  AudioScreen(this.url, this.image, this.episodeName, this.collectionName,
      this.description);
  final String url;
  final String image;
  final String episodeName;
  final String collectionName;
  final String description;

  @override
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  AudioPlayer _audioPlayer;
  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioPlayer
        .setAudioSource(AudioSource.uri(Uri.parse(widget.url)))
        .catchError((onError) {
      print('Error');
    });
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.collectionName,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(widget.image),
              ),
              Center(
                child: PlayerButtons(_audioPlayer),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                child: Text(
                  widget.episodeName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 150,
                  minWidth: MediaQuery.of(context).size.width - 32.0,
                ),
                child: Card(
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(widget.description),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _playerButton(PlayerState playerState) {
  //   final procesingState = playerState?.processingState;
  //   if (procesingState == ProcessingState.loading ||
  //       procesingState == ProcessingState.buffering) {
  //     return Container(
  //       margin: EdgeInsets.all(8.0),
  //       width: 64.0,
  //       height: 64.0,
  //       child: CircularProgressIndicator(),
  //     );
  //   } else if (_audioPlayer.playing != true) {
  //     return IconButton(
  //       icon: Icon(Icons.play_arrow),
  //       iconSize: 64.0,
  //       onPressed: () {
  //         _audioPlayer.play();
  //       },
  //     );
  //   } else if (procesingState != ProcessingState.completed) {
  //     return IconButton(
  //       icon: Icon(Icons.pause),
  //       iconSize: 64.0,
  //       onPressed: _audioPlayer.pause,
  //     );
  //   } else {
  //     return IconButton(
  //       icon: Icon(Icons.replay),
  //       onPressed: () => _audioPlayer.seek(Duration.zero,
  //           index: _audioPlayer.effectiveIndices.first),
  //     );
  //   }
  // }
}
