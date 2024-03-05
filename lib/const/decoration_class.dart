import 'package:flutter/material.dart';


class DecorationClass {
  static const commonDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 1.0)
      ]);

  static BoxDecoration button = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.blue,
  );

  static BoxDecoration addButton = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: Colors.lightBlueAccent,
  );

  static BoxDecoration search = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.lightBlueAccent.withOpacity(0.1),
  );

  static BoxDecoration buttonSelect = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      border: Border.all(color: Colors.lightBlueAccent));

  static BoxDecoration buttonUnSelect = BoxDecoration(
      color: Colors.lightBlueAccent,
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      border: Border.all(color: Colors.lightBlueAccent));

  static BoxDecoration commonImageDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 1.0)
      ]);



  static BoxDecoration commonCourseDecoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 1.0)
      ]);

  static BoxDecoration borderDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
    border: Border.all(color: Colors.grey.withOpacity(0.2)),
  );

  static BoxDecoration designButton = BoxDecoration(
    color: Colors.lightBlueAccent,
    borderRadius: const BorderRadius.all(
      Radius.circular(16.0),
    ),
    boxShadow: [BoxShadow(
          color: Colors.lightBlueAccent.withOpacity(0.5),
          offset: const Offset(1.1, 1.1),
          blurRadius: 10.0),
    ],
  );




  static BoxDecoration roundPlay = BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white
  );


  static BoxDecoration today =  BoxDecoration(
    color: Colors.white.withOpacity(0.2),
    shape: BoxShape.circle,
  );


  static BoxDecoration boxDiary = const BoxDecoration(
      borderRadius: BorderRadius.only(topRight: Radius.circular(68),topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
      boxShadow: [
        BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 1.0)
      ],
      color: Colors.white);





}
