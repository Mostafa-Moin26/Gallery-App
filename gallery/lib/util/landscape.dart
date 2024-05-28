import 'package:flutter/material.dart';
import 'package:gallery/pages/suggestions_page.dart';
import 'package:gallery/util/image_data.dart';
import 'package:google_fonts/google_fonts.dart';

class LandscapePage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String heading;
  final String details;
  final int index;

  const LandscapePage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.heading,
    required this.details,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 390,
            height: 325,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 12,
                  offset: const Offset(5, 12),
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        heading,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 464,
                        child: Text(
                          details,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add your onPressed function here
                        },
                        style: ElevatedButton.styleFrom(
                          // padding:
                          // const EdgeInsets.only(top: 50, left: 424),
                          minimumSize: const Size(0, 51),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          backgroundColor: const Color(0xFF2CAB00),
                          elevation: 0, // Remove default elevation
                        ),
                        child: Center(
                          child: Text(
                            'See More',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
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
            ),
          ),
        ),
      ],
    );
  }
}
