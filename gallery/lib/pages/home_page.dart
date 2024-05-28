import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery/pages/details_page.dart';
import 'package:gallery/util/image_data.dart';

class HomePage extends StatelessWidget {
  // static Color shadowColor = const Color(0xFF000000).withOpacity(0.5);
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 50, 188, 4),
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFF7ACA5E),
            ),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 30),
          ),
        ),
        title: const Text(
          'Photo Gallery',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _calculateGridColumns(context, orientation),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            imagePath: images[index].imagePath,
                            title: images[index].title,
                            heading: images[index].heading,
                            details: images[index].details,
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: orientation == Orientation.portrait ? 180 : 360,
                      height: orientation == Orientation.portrait ? 180 : 360,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 12,
                            offset: const Offset(0, 12),
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(images[index].imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
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
                                images[index].title,
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
                  );
                },
                itemCount: images.length,
              );
            },
          ),
        ),
      ),
    );
  }

  int _calculateGridColumns(BuildContext context, Orientation orientation) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (orientation == Orientation.landscape) {
      return screenWidth > 1200 ? 4 : 4;
    } else {
      return 2;
    }
  }
}
