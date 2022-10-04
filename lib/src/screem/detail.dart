import 'package:fashion_shop_girl/src/constants/colors.dart';
import 'package:fashion_shop_girl/src/constants/widgetforAll.dart';
import 'package:fashion_shop_girl/src/screem/mycart.dart';
import 'package:flutter/material.dart';

import '../models/fashion.dart';
import '../models/textStyler.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  Detail({Key? key, required this.fashion}) : super(key: key);
  late Fashion fashion;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: width * .01, right: width * .01,top: width*.1),
        child: Stack(children: [
          Container(
            color: Colors.yellow,
            child: const Center(),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WidgetForAll.radiusButtons(
                          icon: const Icon(Icons.arrow_back),
                          ontapAction: () {
                            Navigator.pop(context);
                          }),
                      WidgetForAll.radiusButtons(
                          icon: const Icon(Icons.favorite_border),
                          ontapAction: () {})
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * .3),
                  child: Column(
                    children: [
                      TextStyler(
                        "${widget.fashion.name} ${widget.fashion.property}",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "€",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: widget.fashion.price.toString(),
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ))
                          ]))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: width * .1, right: width * .1),
                  width: width * .8,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: AppColors.listCol2),
                  child: Hero(
                    tag: widget.fashion.imageUrl,
                    child: Image(
                      image: AssetImage(widget.fashion.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextStyler(
                  "Select size",
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _caseColor(
                          width: width, color: Colors.black12, action: () {}),
                      _caseColor(
                          width: width, color: Colors.orange, action: () {}),
                      _caseColor(
                          width: width, color: Colors.green, action: () {}),
                      _caseColor(
                          width: width, color: Colors.pink, action: () {}),
                      _caseColor(
                          width: width, color: Colors.red, action: () {}),
                      _caseColor(
                          width: width, color: Colors.white, action: () {}),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "€",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: widget.fashion.price.toString(),
                              style: const TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ))
                        ])),
                    Container(
                      margin: EdgeInsets.only(right: width * .05),
                      width: width * .5,
                      height: width * .15,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart(newFashion: widget.fashion)));
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          child: TextStyler(
                            "Add to cart",
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      )),
    );
  }

  InkWell _caseColor(
      {required double width,
      required Color color,
      required VoidCallback action}) {
    return InkWell(
      onTap: action,
      child: Container(
        width: width * .12,
        height: width * .11,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: color,
        ),
      ),
    );
  }
}
