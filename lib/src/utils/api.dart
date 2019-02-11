import 'package:dio/dio.dart';

import 'package:vplay/src/res/values/strings.dart';

final Dio api = Dio(
  BaseOptions(
    baseUrl: Strings.youtubeBaseUrl,
  ),
);
