import 'package:flutter/material.dart';
import 'package:gallery/app/album_page.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:io';


class MyAlbumApp extends StatefulWidget {
  const MyAlbumApp({super.key});

  @override
  State<MyAlbumApp> createState() => _MyAlbumAppState();
}

class _MyAlbumAppState extends State<MyAlbumApp> {

  List<Album>? _albums;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums = await PhotoGallery.listAlbums(
        mediumType: MediumType.image,
        newest: false,
        hideIfEmpty: false,
      );
        setState(() {
          _albums = albums;
          _loading = false;
        });

    }
    setState(() {
      _loading = false;
    });
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS) {
      if (await Permission.photos.request().isGranted || await Permission.storage.request().isGranted) {
        return true;
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.storage.request().isGranted ||
          await Permission.photos.request().isGranted &&
              await Permission.videos.request().isGranted) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo gallery example'),
        ),
        body: _loading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : LayoutBuilder(
          builder: (context, constraints) {
            double gridWidth = (constraints.maxWidth - 20) / 3;
            double gridHeight = gridWidth + 33;
            double ratio = gridWidth / gridHeight;
            return Container(
              padding: EdgeInsets.all(5),
              child: GridView.count(
                childAspectRatio: ratio,
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: <Widget>[
                  ...?_albums?.map(
                        (album) => GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AlbumPage(album)),
                      ),
                      child: Column(
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
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 2.0),
                            child: Text(
                              album.name ?? "Unnamed Album",
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 2.0),
                            child: Text(
                              album.count.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 12,
                              ),
                            ),
                          ),
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
