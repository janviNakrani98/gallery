import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery/app/folder/viewpage_screen/views/comman_slider.dart';
import 'package:gallery/app/view_page.dart';

import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import '../controllers/viewpage_screen_controller.dart';

class ViewpageScreenView extends GetView<ViewpageScreenController> {
  ViewpageScreenView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    int _currentIndex = 5;
    return GetBuilder<ViewpageScreenController>(
        init: ViewpageScreenController(),
        builder: (context1) {
          return Scaffold(
            appBar: AppBar(
              title:  Text(controller.title1==null?controller.title!:controller.title1!),
              centerTitle: true,
            ),
            body: /* CommanSlider(
              list: controller.media,
              height: MediaQuery.of(context).size.height-100,
              imgHeight: MediaQuery.of(context).size.height-100,
              imgWidth: MediaQuery.of(context).size.width-10,
              mediumId: controller.mediumId,
              controller: controller,


            ),*/
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height-100,
                        autoPlay: false,
                        initialPage: controller.mediumId,

                        onPageChanged: (index, onPage) {
                          _currentIndex = index;

                          controller.title1 = controller.media![index].filename!;
                          controller.update();


                        },

                        viewportFraction: 1,
                        autoPlayInterval: const Duration(seconds: 1)),
                    items: controller.media!.map((medium) {
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
                                          height: MediaQuery.of(context).size.height-100,
                                          width: MediaQuery.of(context).size.width-10,
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
              )
          );
        });


  }
}
