import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:vplay/src/components/modal_dialog.dart';

import 'package:vplay/src/components/modal_stack.dart';
import 'package:vplay/src/components/navbar.dart';
import 'package:vplay/src/res/values/strings.dart';
import 'package:vplay/src/store/models/models.dart';
import 'package:vplay/src/store/actions/actions.dart';
import 'package:vplay/src/utils/api.dart';

class VideosPage extends StatefulWidget {
  static String tag = "/videos_page";
  @override
  State<StatefulWidget> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String keyword = "trailer";

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
                title: Text("Trailer Movies"),
              ),
              body: Container(
                child: ListView(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 30,
                  ),
                  children: _listWidget(store, context, _key, keyword),
                ),
              ),
              drawer: NavBar(store: store),
            ),
          ),
    );
  }
}

List<Widget> _listWidget(Store<AppState> store, BuildContext context,
    GlobalKey<FormState> key, String keyword) {
  List<Video> videos = store.state.videos;
  List<Widget> widgets = List<Widget>();
  widgets.add(
    Container(
      padding: EdgeInsets.only(
        left: 30,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: key,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: "keyword",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "cannot be empty";
                  }
                },
                onSaved: (value) {
                  keyword = value;
                },
              ),
            ),
            FlatButton(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                if (key.currentState.validate()) {
                  key.currentState.save();
                  store.dispatch(VideosOnLoadAction());
                  _reFetchVideos(keyword).then((videos) {
                    store.dispatch(VideosLoadedAction(videos));
                  }).catchError((err) {
                    store.dispatch(VideosFailedAction());
                    return ModalDialog(
                      title: "Failed",
                      content: err.toString(),
                    );
                  });
                }
              },
            )
          ],
        ),
      ),
    ),
  );
  if (videos.isNotEmpty) {
    videos.forEach((video) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(
            top: 15,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / 3),
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

Future<List<Video>> _reFetchVideos(String keyword) async {
  List<Video> videos;
  Response response = await api.get("/search", queryParameters: {
    "key": Strings.youtubeApiKey,
    "part": "snippet",
    "maxResults": "25",
    "q": keyword,
  });
  if (response.statusCode == 200) {
    videos = (response.data["items"] as List).map((item) {
      Video video = Video.fromJson(item);
      return video;
    }).toList();
  }
  return videos;
}
