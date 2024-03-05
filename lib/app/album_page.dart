import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/folder/viewpage_screen/views/viewpage_screen_view.dart';
import 'package:gallery/app/view_page.dart';
import 'package:gallery/const/text_style_class.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';


class AlbumPage extends StatefulWidget {
  final Album album;

  AlbumPage(Album album) : album = album;

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  List<Medium>? media;

   List<int>? data;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  Future<Medium> Function() makeFunction(index) {
    return () async {
      Medium medium = await PhotoGallery.getMedium(
          mediumId: index,
          mediumType: MediumType.image
      );
      return medium;
    };
  }


  Future<Medium> fetchUserInfo(String index) async {
    Medium fetchedUser;
    Medium medium = await PhotoGallery.getMedium(
        mediumId: index,
        mediumType: MediumType.image
    );
    return medium;
  }

  void initAsync() async {
    // data = await widget.album.getThumbnail();

    MediaPage mediaPage = await widget.album.listMedia();
    setState(() {
      media = mediaPage.items;

    });

    print("media===$media");
     data = await PhotoGallery.getAlbumThumbnail(
      albumId: widget.album.id,
      mediumType: MediumType.image,
      newest: false,
      width: 128,
      height: 128,
      highQuality: true,
    );

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.album.name ?? "Unnamed Album"),
        ),
        body: GridView.builder(
          itemCount: media!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0,
        ), itemBuilder: (context, index) {

          return GestureDetector(
            onTap: (){
              Get.to(ViewpageScreenView(),arguments:  [
                {"list": media},
                {"page_no": index},
                {"file_name": media![index].filename},
              ]);
            },
            child:  Container(
                color: Colors.grey[300],
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: ThumbnailProvider(
                    mediumId: media![index].id,
                    mediumType: media![index].mediumType,
                    highQuality: true,
                  ),
                ),
            ),
          );
        },)


        /*body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          children: <Widget>[
            ...?media?.map((medium) {
                    return GestureDetector(
                onTap: () {
                  Get.to(ViewpageScreenView(),arguments:  [
                    {"list": media},
                    {"page_no": medium.id}
                  ]);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewpageScreenView(media)),);
                },
                child: Container(
                  color: Colors.grey[300],
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: ThumbnailProvider(
                      mediumId: medium.id,
                      mediumType: medium.mediumType,
                      highQuality: true,
                    ),
                  ),
                ),
              );
                  },
            ),
          ],
        ),*/
      );

  }
}
