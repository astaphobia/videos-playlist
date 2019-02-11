import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import 'package:vplay/src/components/modal_stack.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/actions/actions.dart';

class VideosPage extends StatefulWidget {
  static String tag = "/videos_page";
  @override
  State<StatefulWidget> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      onInit: (store) {
        store.dispatch(VideosOnInitActions());
      },
      converter: (Store<AppState> store) => store,
      builder: (context, store) => ModalStack(
            isLoading: store.state.isLoading,
            cancelable: false,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Videos"),
              ),
              body: Container(
                child: ListView(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  children: _listWidget(store),
                ),
              ),
            ),
          ),
    );
  }
}

List<Widget> _listWidget(Store<AppState> store) {
  List<Video> videos = store.state.videos;
  List<Widget> widgets = List<Widget>();
  if (videos.length <= 0) {
    widgets.add(Text("loading"));
  } else {
    videos.forEach((video) {
      widgets.add(
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(
                    width: video.snippet.thumbnails["medium"].width.toDouble(),
                    height: video.snippet.thumbnails["medium"].height.toDouble(),
                  ),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        video.snippet.thumbnails["medium"].url,
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.teal[800],
                    size: 50,
                   ),
                ),
                onPressed: () => FlutterYoutube.playYoutubeVideoById(
                      apiKey: Strings.youtubeApiKey,
                      videoId: video.id.videoId,
                      autoPlay: false,
                      fullScreen: false,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 11,
                  top: 5,
                ),
                child: Text(
                  video.snippet.title,
                  textAlign: TextAlign.left,
                ),
              ),
              ExpansionTile(
                title: Text("Description"),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 11,
                    ),
                    child: Text(video.snippet.description),
                  )
                ],
              ),
              // Divider(),
            ],
          ),
        ),
      );
    });
  }
  return widgets;
}
