import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';
import '../services/podcastindex_service.dart';
import '../models/podcast_model.dart';
import '../services/episode_service.dart';
import './episode_screen.dart';

class PodcastIndexScreen extends StatefulWidget {
  @override
  _PodcastIndexScreenState createState() => _PodcastIndexScreenState();
}

class _PodcastIndexScreenState extends State<PodcastIndexScreen> {
  PodcastIndexService podcastIndexService = PodcastIndexService();

  EpisodeService episodeService = EpisodeService();

  List<Feed>? _feeds;
  bool isSearching = false;
  late String searchTerm;
  final textController = TextEditingController();

  Future<void> getPodcasts(String searchTerm) async {
    await podcastIndexService.fetchPodCastIndex(searchTerm).then((feeds) {
      if (feeds.isEmpty) {
        Alert(context: context, type: AlertType.error, title: 'Nothing found!')
            .show();
      } else {
        setState(() {
          _feeds = feeds;
        });
      }
    }).catchError((error) {
      print('Some eror $error');
    });
  }

  @override
  void initState() {
    super.initState();
    podcastIndexService.fetchPodCastIndex('this+american+life').then((feeds) {
      setState(() {
        _feeds = feeds;
      });
    });
  }

  Future<void> prepareEpisodes() async {}

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text('Search Results',
                  style: TextStyle(
                    fontSize: 24,
                  )),
            ),
            if (_feeds == null)
              Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: ListView.builder(
                    itemCount: _feeds!.length < 10 ? _feeds!.length : 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 100,
                          child: Card(
                            elevation: 5,
                            child: SingleChildScrollView(
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                    _feeds![index].image!,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image(
                                        image: AssetImage('assets/dd.png'),
                                      );
                                    },
                                  ),
                                ),
                                title: Text(_feeds![index].title!),
                                subtitle: Text(_feeds![index].description!),
                                dense: true,
                                trailing: IconButton(
                                  onPressed: () async {
                                    var itunesId = _feeds![index].itunesId;

                                    if (itunesId != null) {
                                      var episodeList = await episodeService
                                          .getEpisodes(itunesId.toString());

                                      var headers = episodeList.removeAt(0);

                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EpisodeScreen(
                                              headers, episodeList),
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.open_in_new),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
          ],
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: !isSearching
          ? SizedBox()
          : IconButton(
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                  print('cancel');
                });
              },
              icon: Icon(Icons.cancel_outlined),
            ),
      title: !isSearching
          ? Text('Podcast')
          : TextField(
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              autofocus: true,
              controller: textController,
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: '    ...search here for a podcast'),
            ),
      centerTitle: true,
      actions: [
        !isSearching
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
                icon: Icon(Icons.search),
              )
            : IconButton(
                onPressed: () async {
                  var regexp = RegExp(r'^[a-zA-Z0-9\s+]+$');
                  var temp = textController.text.trim();
                  textController.clear();

                  // temp.contains(r'/[|\\/~^:,;?!&%$@*+]/');

                  if (regexp.hasMatch(temp)) {
                    setState(() {
                      isSearching = false;
                      searchTerm = temp.replaceAll(' ', '+');
                    });
                    await getPodcasts(searchTerm);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(16),
                        elevation: 5,
                        content: Text(
                          'Illegal search term!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  setState(() {
                    isSearching = false;
                  });

                  await SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                icon: Icon(Icons.arrow_forward_outlined),
              ),
      ],
    );
  }
}
