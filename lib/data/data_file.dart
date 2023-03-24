import 'package:flutter/material.dart';

final List<Course> course = [
  Course(
    text: "Item 1",
    lessons: "300 Items",
    imageUrl: "images/pic/img1.png",
    percent: 75,
    backImage: "images/box/box1.png",
    color: Colors.blue,
  ),
  Course(
    text: "Items",
    lessons: "40 Items",
    imageUrl: "images/pic/img2.png",
    percent: 50,
    backImage: "images/box/box2.png",
    color: Colors.orange,
  ),
  Course(
    text: "Items",
    lessons: "200 Items",
    imageUrl: "images/pic/img3.png",
    percent: 25,
    backImage: "images/box/box3.png",
    color: Colors.green,
  ),
  Course(
    text: "Items",
    lessons: "240 Items",
    imageUrl: "images/pic/img4.png",
    percent: 75,
    backImage: "images/box/box4.png",
    color: Colors.yellow,
  ),
];

final List<Planing> planing = [
  Planing(
    heading: "Received item A",
    subHeading: "8:00 AM at Yesterday",
    color: Colors.blue,
    icon: Icon(
      Icons.menu_book_outlined,
      color: Colors.blue[900],
    ),
  ),
  Planing(
    heading: "Received item B",
    subHeading: "03:00 PM at Today",
    color: const Color(0xffE2EDD2),
    icon: const Icon(
      Icons.headphones,
      color: Colors.green,
    ),
  ),
  Planing(
    heading: "Received item C",
    subHeading: "12:00 PM at Yesterday",
    color: const Color(0xffF9F0D3),
    icon: const Icon(
      Icons.volume_mute,
      color: Colors.yellow,
    ),
  ),
  Planing(
    heading: "Received item D",
    subHeading: "12:00 PM",
    color: const Color(0xffF9E5D2),
    icon: const Icon(
      Icons.edit,
      color: Colors.orange,
    ),
  ),
  Planing(
    heading: "Received item E",
    subHeading: "8:00 AM",
    color: const Color(0xffE2EDD2),
    icon: const Icon(
      Icons.headphones,
      color: Colors.green,
    ),
  ),
  Planing(
    heading: "Received item N",
    subHeading: "9:00 AM",
    color: const Color(0xffF9E5D2),
    icon: const Icon(
      Icons.edit,
      color: Colors.orange,
    ),
  ),
  Planing(
    heading: "Received item R",
    subHeading: "07:00 PM",
    color: const Color(0xffF9F0D3),
    icon: const Icon(
      Icons.volume_off_outlined,
      color: Colors.yellow,
    ),
  ),
  Planing(
    heading: "Items O",
    subHeading: "01:00 PM - 02:00 PM",
    color: Colors.blue,
    icon: Icon(
      Icons.menu_book_outlined,
      color: Colors.blue[900],
    ),
  ),
];

final List<Statistics> statistics = [
  Statistics(
    title: "Items A",
    number: "30",
  ),
  Statistics(
    title: "Items B",
    number: "250",
  ),
  Statistics(
    title: "Items N",
    number: "03",
  ),
  Statistics(
    title: "TOTAL ITEMS in Inventory",
    number: "589",
  )
];

class Course {
  final String text;
  final String lessons;
  final String imageUrl;
  final double percent;
  final String backImage;
  final Color color;

  Course({
    required this.text,
    required this.lessons,
    required this.imageUrl,
    required this.percent,
    required this.backImage,
    required this.color,
  });
}

class Planing {
  final String heading;
  final String subHeading;
  final Icon icon;
  final Color color;

  Planing({
    required this.heading,
    required this.subHeading,
    required this.icon,
    required this.color,
  });
}

class Statistics {
  final String title;
  final String number;

  Statistics({
    required this.title,
    required this.number,
  });
}
