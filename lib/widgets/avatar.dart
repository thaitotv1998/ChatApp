import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.radius, required this.url})
      : super(key: key);

  const Avatar.small({Key? key, required this.url})
      : radius = 18,
        super(key: key);

  const Avatar.normal({Key? key, required this.url})
      : radius = 26,
        super(key: key);

  const Avatar.large({Key? key, required this.url})
      : radius = 44,
        super(key: key);

  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).cardColor,
      backgroundImage: CachedNetworkImageProvider(url),
    );
  }
}
