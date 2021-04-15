import 'package:flutter/material.dart';
import 'package:listofimages/page1.dart';

class ImageList extends StatelessWidget {

  final List<ImageModel> images;
  ImageList(this.images);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount:images.length,
        itemBuilder: (context,int index){
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey)
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.network(images[index].url),
              ],
            )//
          );//
        },

    );
  }
}
