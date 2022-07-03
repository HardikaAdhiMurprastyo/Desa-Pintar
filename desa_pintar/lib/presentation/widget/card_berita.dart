import 'package:desa_pintar/data/model/berita_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CardBerita extends StatelessWidget {
  // const CardBerita({Key? key}) : super(key: key);
  final Berita berita;
  const CardBerita({required this.berita});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 226, 246, 239),
            ),
            margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
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
                // onTap: () {},
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(
                              top: 10, left: 15, right: 15, bottom: 5),
                          child: Container(
                            // BoxFit.fitHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                berita.urlToImage!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          //   ),
                          // ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                berita.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.all(3),
                                child: ReadMoreText(
                                  berita.description ?? "-",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  colorClickableText: Colors.black,
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: "Show More",
                                  trimExpandedText: "Show Less",
                                  lessStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 61, 192, 150),
                                  ),
                                  moreStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                    color: Color.fromARGB(255, 61, 192, 150),
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
    );
  }
}
