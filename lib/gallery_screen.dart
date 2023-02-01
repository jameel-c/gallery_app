import 'package:flutter/material.dart';
import 'package:gallery_app/responsive_layout.dart';


class GalleryScreen extends StatelessWidget {
  final String image;
  const GalleryScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                image,
                height: ResponsiveLayout.isTablet(context) ? 350 : 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  '$image',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
