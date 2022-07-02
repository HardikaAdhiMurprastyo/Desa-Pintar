import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readmore/readmore.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'https://bit.ly/3x1240c',
    'https://bit.ly/3Nb2qbD',
    'https://bit.ly/3PQSqGh',
    'https://bit.ly/3NR5o4G',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                // elevation: 10,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                expandedHeight: 121.0,
                actions: [],
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: Color.fromARGB(255, 61, 192, 150),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/assets_dpin/appbar.png',
                    fit: BoxFit.fitWidth,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "D'PIN",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              TextSpan(
                                text: '\nDesa Pintar',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                        EdgeInsets.only(right: 10, top: 10, bottom: 18),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          child: Icon(
                            Icons.home_sharp,
                            color: Color.fromARGB(255, 61, 192, 150),
                          ),
                        ),
                      ),
                    ],
                  ),
                  titlePadding: const EdgeInsets.only(left: 16),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: const Text(
                          'REKOMENDASI',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            onPageChanged: (index, carouselReason) {
                              print(index);
                              setState(() {
                                _current = index;
                              });
                            }),
                        items: imgList
                            .map(
                              (item) => Container(
                            margin: const EdgeInsets.all(3.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(item,
                                      fit: BoxFit.cover, width: 1000.0),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                      .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: const Text(
                          'BERITA TERSPICY',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 226, 246, 239),
                              ),
                              margin: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              color: Colors.white,
                                            ),
                                            margin: const EdgeInsets.only(
                                                top: 6,
                                                left: 15,
                                                right: 15,
                                                bottom: 5),

                                            // height: 110,
                                            // width: 200,
                                            // child: Padding(
                                            //   padding: const EdgeInsets.symmetric(
                                            //       vertical: 20, horizontal: 110),
                                            //   child: SizedBox(
                                            //     width: 110,
                                            //     height: 110,
                                            child: FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                child: Image.asset(
                                                    'assets/assets_dpin/logo.png'),
                                              ),
                                            ),
                                            //   ),
                                            // ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10,
                                                top: 10,
                                                bottom: 10,
                                                right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Surat Pengantar SKCK',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Container(
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  child: const ReadMoreText(
                                                    "but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,and more recently with desktop publishing software like Aldus PageMaker",
                                                    textAlign: TextAlign.justify,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    colorClickableText:
                                                    Colors.black,
                                                    trimLines: 2,
                                                    trimMode: TrimMode.Line,
                                                    trimCollapsedText:
                                                    "Show More",
                                                    trimExpandedText: "Show Less",
                                                    lessStyle: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 61, 192, 150),
                                                    ),
                                                    moreStyle: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      height: 1,
                                                      color: Color.fromARGB(
                                                          255, 61, 192, 150),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}