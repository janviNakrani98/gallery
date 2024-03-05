import 'package:flutter/material.dart';
import 'package:gallery/app/album_page.dart';
import 'package:gallery/const/text_style_class.dart';

import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

import '../controllers/image_screen_controller.dart';

class ImageScreenView extends GetView<ImageScreenController> {
  const ImageScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ImageScreenController controller = Get.put(ImageScreenController());

    return Scaffold(
      body:  controller.loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :

      LayoutBuilder(
        builder: (context, constraints) {
      double gridWidth = (constraints.maxWidth - 40) / 2;
      double gridHeight = gridWidth + 40;
      double ratio = gridWidth / gridHeight;
      return Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          childAspectRatio: ratio,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: <Widget>[
            ...?controller.albums?.map(
                  (album) => GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AlbumPage(album)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        color: Colors.grey[300],
                        height: gridWidth,
                        width: gridWidth,
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: MemoryImage(kTransparentImage),
                          image: AlbumThumbnailProvider(
                            album: album,
                            highQuality: true,
                          ),
                        ),
                      ),
                    ),
                    Text(album.name ?? "Unnamed Album",maxLines: 1,style: TextStyleClass.commonTextStyle),
                    Text(album.count.toString(),maxLines: 1,style: TextStyleClass.commonTextSmall),

                  ],
                ),
              ),
            ),
          ],
        ),
      );
        },
      ),
    );
  }
}
