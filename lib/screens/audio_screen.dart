import 'package:flutter/material.dart';

class AudioScreen extends StatelessWidget {
  AudioScreen(this.url, this.image, this.episodeName, this.collectionName,
      this.description);
  final String url;
  final String image;
  final String episodeName;
  final String collectionName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            collectionName,
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
                  child: Image.network(image),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
                  child: Text(
                    episodeName,
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
                        child: Text(description),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
