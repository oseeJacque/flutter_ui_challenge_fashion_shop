import 'package:fashion_shop_girl/src/constants/widgetforAll.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/fashion.dart';
import '../models/textStyler.dart';
import 'mycart.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _value = 2;
  int nbr = 1;
  late double subTotal = 0.0;
  late double shipping = 0.0;

  void initState() {
    super.initState();
    for (Fashion fleure in MyCart.myCollection) {
      subTotal += fleure.price;
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.bg,
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(left: width * .01, right: width * .01,top: width*.1),
              child: Stack(
                children: [
                  Container(
                    color: Colors.yellow,
                    child: const Center(),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      //shrinkWrap: true,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              children: [
                                WidgetForAll.radiusButtons(
                                    icon: const Icon(Icons.arrow_back),
                                    ontapAction: () {
                                      Navigator.pop(context);
                                    }),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .3,
                                ),
                                TextStyler(
                                  "Checkout",
                                  fontSize: 15.0,
                                ),
                              ],
                            )),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 35.0),
                                  child: TextStyler(
                                    "Delivery Address",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 35.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                              color: Colors.black12),
                                          child: const Icon(
                                            Icons.location_on,
                                            color: Colors.black,
                                            size: 30.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextStyler(
                                              "20845 Oakridge Farme Lane",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            TextStyler(
                                              "New York(NYC)",
                                              fontSize: 15.0,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 30.0,
                                          color: Colors.black26,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 35.0,
                              ),
                              TextStyler(
                                "Paymenth Method",
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              color: Colors.black12),
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/fonts/ImageFashion/mastercard-.png"),
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Column(
                                          children: [
                                            TextStyler(
                                              "MasterCard Pay",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            TextStyler(
                                              "........ 0357 8420",
                                              fontSize: 15.0,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Radio(
                                      activeColor: Colors.green,
                                      value: 1,
                                      groupValue: _value,
                                      onChanged: ((value) {
                                        setState(() {
                                          _value = value as int;
                                        });
                                      }),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Colors.black12),
                                            child: const Image(
                                              image: AssetImage(
                                                "assets/fonts/ImageFashion/apple-.png",
                                              ),
                                              width: 30.0,
                                              height: 30.0,
                                            )),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Column(
                                          children: [
                                            TextStyler(
                                              "Apple Pay",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            TextStyler(
                                              "........ 0357 8420",
                                              fontSize: 15.0,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Radio(
                                      activeColor: Colors.green,
                                      value: 2,
                                      groupValue: _value,
                                      onChanged: ((value) {
                                        setState(() {
                                          _value = value as int;
                                        });
                                      }),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Colors.black12),
                                            child: const Image(
                                              image: AssetImage(
                                                  "assets/fonts/ImageFashion/paypal.png"),
                                              width: 30.0,
                                              height: 30.0,
                                            )),
                                        const SizedBox(
                                          width: 15.0,
                                        ),
                                        Column(
                                          children: [
                                            TextStyler(
                                              "PayPal Pay",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            TextStyler(
                                              "........ 0357 8420",
                                              fontSize: 15.0,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Radio(
                                      activeColor: Colors.green,
                                      value: 3,
                                      groupValue: _value,
                                      onChanged: ((value) {
                                        setState(() {
                                          _value = value as int;
                                        });
                                      }),
                                    )
                                  ],
                                ),
                              ),
                               SizedBox(
                                height: width*.05,
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: TextStyler("My Cart",fontSize: 20.0,fontWeight: FontWeight.bold,)),
                                 SizedBox(height:width *.05,),
                              _bottomListView(context, width),                
                               
                              Padding(padding: EdgeInsets.only(top:width*.1 ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextStyler("Total",fontSize: 20.0,color: Colors.black54,), 
                                  RichText(
                            text: TextSpan(
                                text: "€",
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: subTotal.toString(),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ]))
                                ],
                              ),
                              ),
                              SizedBox(
                                height: width*.1,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width*.1,right: width*.1),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: MediaQuery.of(context).size.width * .12,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  30.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.black),
                                    ),
                                    child: TextStyler(
                                      "Pay Now",
                                      fontSize: 20.0,
                                      color: AppColors.bg,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50.0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  Widget _bottomListView(BuildContext context, double width) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      height: width * .3,
      child: ListView.builder(
          reverse: false,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.only(right: 15.0),
          physics: const BouncingScrollPhysics(),
          itemCount: MyCart.myCollection.length,
          itemBuilder: (context, index) {
            return Container(
              width: width * .55,
              height: width * .3,
              margin: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * .25,
                    height: width * .3,
                    child: Stack(children: [
                      Container(
                        width: width * .4,
                        height: width * .3,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            color: index % 2 != 0
                                ? AppColors.listCol2
                                : AppColors.listCol1),
                        child: Image(
                            image: AssetImage(
                                MyCart.myCollection[index].imageUrl)),
                      ),
                      Positioned(
                          right: 2.0,
                          top: 2.0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              size: 15.0,
                              color: Colors.black54,
                            ),
                          ))
                    ]),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .25,
                    height: width * .3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextStyler(
                          MyCart.myCollection[index].name,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        TextStyler(
                          MyCart.myCollection[index].property,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TextStyler(
                          "Size: ${MyCart.myCollection[index].size[0]}",
                          fontSize: 15.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "€",
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: MyCart.myCollection[index].price
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
