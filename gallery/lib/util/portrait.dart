import 'package:flutter/material.dart';
import 'package:gallery/pages/suggestions_page.dart';
import 'package:gallery/util/image_data.dart';
import 'package:google_fonts/google_fonts.dart';

class PortraitPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String heading;
  final String details;
  final int index;

  const PortraitPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.heading,
    required this.details,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 325,
          margin: const EdgeInsets.only(top: 15, left: 19, right: 19),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                details,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // padding:
                  // const EdgeInsets.only(top: 50, left: 424),
                  minimumSize: const Size(0, 51),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  backgroundColor: const Color(0xFF2CAB00),
                  elevation: 0,
                ),
                child: Center(
                  child: Text(
                    'See More',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Suggestions',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2CAB00),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SuggestionsPage(imagePath: imagePath, title: title, index: index),
            ],
          ),
        ),
      ],
    );
  }
}
