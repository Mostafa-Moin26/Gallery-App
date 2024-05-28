import 'package:flutter/material.dart';
import 'package:gallery/util/image_data.dart';

class SuggestionsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final int index;

  const SuggestionsPage(
      {required this.imagePath,
      required this.title,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(6, 11),
                      blurRadius: 35,
                      color: Colors.transparent,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(index == images.length - 1
                        ? images[0].imagePath
                        : images[index + 1].imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  width: 180,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                    color: Colors.transparent,
                    boxShadow: [],
                  ),
                  child: Text(
                    index == images.length - 1
                        ? images[0].title
                        : images[index + 1].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(6, 11),
                      blurRadius: 35,
                      color: Colors.transparent,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      (index == images.length - 1)? images[1].imagePath
                        : (index == images.length - 2) ? images[0].imagePath
                        : images[index + 2].imagePath
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  width: 180,
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                    color: Colors.transparent,
                    boxShadow: [],
                  ),
                  child: Text(
                      (index == images.length - 1)? images[1].title
                        : (index == images.length - 2) ? images[0].title
                        : images[index + 2].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
