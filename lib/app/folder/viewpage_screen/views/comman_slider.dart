
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/folder/viewpage_screen/controllers/viewpage_screen_controller.dart';
import 'package:gallery/app/view_page.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class CommanSlider extends StatefulWidget {
  CommanSlider(
      {super.key, this.list, this.height, this.imgHeight, this.imgWidth,this.mediumId});

  List<Medium>? list;
  double? height;
  double? imgHeight;
  double? imgWidth;
  bool? autoPlay;
  int? mediumId;

  @override
  State<CommanSlider> createState() => _CommanSliderState();
}

class _CommanSliderState extends State<CommanSlider> {

  int _currentIndex = 5;


  @override
  Widget build(BuildContext context) {
    ViewpageScreenController controller = Get.put(ViewpageScreenController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height,
              autoPlay: false,
              initialPage: widget.mediumId!,

              onPageChanged: (index, onPage) {
                _currentIndex = index;

                setState(() {
                  controller.title1 = widget.list![index].filename!;
                });


              },

              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 1)),
          items: widget.list!.map((medium) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.center,
                            child: medium.mediumType == MediumType.image
                                ? GestureDetector(
                              onTap: () async {
                                PhotoGallery.deleteMedium(mediumId: medium.id);
                              },
                              child: FadeInImage(
                                height: widget.imgHeight,
                                width: widget.imgWidth,
                                placeholder: MemoryImage(kTransparentImage),
                                image: PhotoProvider(mediumId: medium.id),
                              ),
                            )
                                : VideoProvider(
                              mediumId: medium.id,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
