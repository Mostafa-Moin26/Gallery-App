import 'package:flutter/material.dart';
import 'package:gallery/util/landscape.dart';
import 'package:gallery/util/portrait.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String heading;
  final String details;
  final int index;

  const DetailsPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.heading,
    required this.details,
    required this.index,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
             color: const Color(0xFF7ACA5E),
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
        titleSpacing: 0,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext context) {
            final orientation = MediaQuery.of(context).orientation;
            if (orientation == Orientation.portrait) {
              return PortraitPage(
                imagePath: imagePath, 
                title: title,
                heading: heading, 
                details: details, 
                index: index);
            } else {
              return LandscapePage(
                imagePath: imagePath, 
                title: title, 
                heading: heading,
                details: details, 
                index: index);
            }
          },
        ),
      ),
    );
  }
}
