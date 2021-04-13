import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/episodes.dart';
import './audio_screen.dart';

class EpisodeScreen extends StatelessWidget {
  EpisodeScreen(this.headers, this.episodes);

  final Result headers;
  final List<Result> episodes;
  final newFormat = DateFormat("dd-MM-y");
  final TextStyle defaultStyle = TextStyle(fontSize: 12, color: Colors.black);
  func<String>(DateTime inp) {
    return newFormat.format(inp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(headers.collectionName, style: TextStyle(fontSize: 24)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: episodes.length < 10 ? episodes.length : 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 100,
                    child: Card(
                      elevation: 5,
                      child: SingleChildScrollView(
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: episodes[index].trackName,
                                children: <TextSpan>[
                                  TextSpan(
                                      style: TextStyle(fontSize: 10),
                                      text:
                                          ' ${func(episodes[index].releaseDate)}')
                                ]),
                          ),
                          subtitle: Text(episodes[index].description),
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AudioScreen(
                                        episodes[index].trackViewUrl,
                                        episodes[index].artworkUrl600,
                                        episodes[index].trackName,
                                        episodes[index].collectionName,
                                        episodes[index].description),
                                  ),
                                );
                              },
                              icon: Icon(Icons.play_circle_filled)),
                          dense: true,
                          isThreeLine: true,
                        ),
                      ),
                    ),
                  );
                }),
          ),

          // Text(episodes[1].releaseDate.toString()),
          // Text.episodes[0].artistName),
          // // Text(episodes[0].collectionName),
          // Text(widget.episodes[0].collectionName.toString()),
          // Text(widget.episodes[1].trackName),
        ],
      ),
    );
  }
}
