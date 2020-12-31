import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoadTools {
  ///
  static Widget load(String url, {BoxFit fit = BoxFit.fill}) {
    return CachedNetworkImage(imageUrl: url, fit: fit);
  }

}
