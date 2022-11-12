// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class DietResepPage extends StatefulWidget {
  const DietResepPage({super.key});

  @override
  State<DietResepPage> createState() => _DietResepPageState();
}

class _DietResepPageState extends State<DietResepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Image(
              image: AssetImage("assets/images/splashScreen_logo.png"),
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Diet Yuk")
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Program Diet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            CardGenerator(),
            SizedBox(
              height: 30,
            ),
            CarouselCard()
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Card CardGenerator() {
  return Card(
    child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Title(
                  color: Colors.black,
                  child: const Text(
                    "Result of the week",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [Text("Turun 10 kg"), Text("Resep diolah")],
          )
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
GFItemsCarousel CarouselCard() {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  return GFItemsCarousel(
    rowCount: 3,
    children: imageList.map(
      (url) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next_sharp,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
          ),
        );
      },
    ).toList(),
  );
}
