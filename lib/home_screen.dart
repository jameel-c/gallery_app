import 'package:flutter/material.dart';
import 'package:gallery_app/gallery_screen.dart';
import 'package:gallery_app/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final urlImages = [
     "https://picsum.photos/id/237/200/300","https://picsum.photos/id/238/200/300",
    "https://picsum.photos/id/239/200/300","https://picsum.photos/id/233/200/300",
    "https://picsum.photos/id/241/200/300","https://picsum.photos/id/240/200/300",
    "https://picsum.photos/id/242/200/300","https://picsum.photos/id/243/200/300",
    "https://picsum.photos/id/244/200/300","https://picsum.photos/id/235/200/300",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: OrientationBuilder(
                        builder: (context,orientation) {
                          return GridView.builder(
                            gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: ResponsiveLayout.isTablet(context) ?  orientation == Orientation.portrait ? 2 : 4: orientation == Orientation.portrait ? 2 : 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              return RawMaterialButton(
                                child: InkWell(
                                  child: Ink.image(
                                    image: NetworkImage(urlImages[index]),
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GalleryScreen(
                                            image: urlImages[index],
                                          )));
                                },
                              );
                            },
                            itemCount: urlImages.length,
                          );
                        }
                      )))
            ],
          )),
    );
  }
}
