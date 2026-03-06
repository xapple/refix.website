import 'package:flutter/widgets.dart';

bool isRemoteImageSource(String source) {
  return source.startsWith('http://') || source.startsWith('https://');
}

ImageProvider<Object> imageProviderFromSource(String source) {
  if (isRemoteImageSource(source)) {
    return NetworkImage(source);
  }
  return AssetImage(source);
}
