import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      required this.assetImage,
      required this.volume,
      required this.opacity,
      required this.imageOpacity});
  final String assetImage;
  final bool volume;
  final double opacity;
  final double imageOpacity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Opacity(
              opacity: imageOpacity,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assetImage),
                  ),
                ),
              )),
        ),
        Positioned(
          child: Opacity(
            opacity: opacity,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 3,
              child: volume
                  ? Image(
                      fit: BoxFit.cover,
                      image: const AssetImage("assets/images/game/checked.png"),
                      width: (MediaQuery.of(context).size.width / 6) - 100,
                      height: (MediaQuery.of(context).size.width / 6) - 100,
                    )
                  : Image.asset(
                      "assets/images/xxxx.png",
                      fit: BoxFit.cover,
                      width: (MediaQuery.of(context).size.width / 6) - 150,
                      height: (MediaQuery.of(context).size.width / 6) - 150,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
