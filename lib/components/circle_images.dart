import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImages extends StatelessWidget {
  final imageUrl;
  final double imageRadius;
  const CircleImages(
      {Key? key, required this.imageUrl, required this.imageRadius})
      : super(key: key);
// child:Image.network(listViewModel.articles[index].imageUrl)
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: this.imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        );
      },
      placeholder: (context, url) => Center(
          child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x40000080).withOpacity(0.15),
              blurRadius: 0.01,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
      )),
      fadeInDuration: Duration(milliseconds: 0),
      fadeOutDuration: Duration(milliseconds: 0),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
