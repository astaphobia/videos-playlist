import 'package:meta/meta.dart';

@immutable
class Video {
  final String kind, etag;
  final ID id;
  final Snippet snippet;

  Video({
    this.kind = '',
    this.etag = '',
    this.id,
    this.snippet,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      kind: json["kind"],
      etag: json["etag"],
      id: ID.fromJson(json["id"]),
      snippet: Snippet.fromJson(json["snippet"]),
    );
  }
}

class ID {
  final String kind, videoId;
  ID({
    this.kind = '',
    this.videoId = '',
  });
  factory ID.fromJson(Map<String, dynamic> json) => ID(
        kind: json["kind"],
        videoId: json["videoId"],
      );
}

class Snippet {
  final publishedAt,
      channelId,
      title,
      description,
      channelTitle,
      liveBroadcastContent;
  final Map<String, Thumbnail> thumbnails;
  Snippet({
    this.publishedAt = '',
    this.channelId = '',
    this.title = '',
    this.description = '',
    this.channelTitle = '',
    this.liveBroadcastContent = 'none',
    this.thumbnails,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      publishedAt: json["publishedAt"],
      channelId: json["channelId"],
      title: json["title"],
      description: json["description"],
      channelTitle: json["channelTitle"],
      liveBroadcastContent: json["liveBroadcastContent"],
      thumbnails: _assertThumbnails(json["thumbnails"]),
    );
  }
}

class Thumbnail {
  final String url;
  final int width, height;
  Thumbnail({
    this.url,
    this.width = 0,
    this.height = 0,
  });
  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      url: json["url"],
      width: json["width"],
      height: json["height"],
    );
  }
  @override
  String toString() {
    return "{url: $url, width: $width, height: $height}";
  }
}

Map<String, Thumbnail> _assertThumbnails(Map<String, dynamic> items) {
  Map<String, Thumbnail> thumbs = Map<String, Thumbnail>();
  items.forEach((key, item) {
    thumbs[key] = Thumbnail.fromJson(item);
  });
  return thumbs;
}
