import 'package:fashion_shop_girl/src/constants/colors.dart';
import 'package:fashion_shop_girl/src/constants/widgetforAll.dart';
import 'package:fashion_shop_girl/src/models/fashion.dart';
import 'package:fashion_shop_girl/src/models/textStyler.dart';
import 'package:fashion_shop_girl/src/screem/detail.dart';
import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> with SingleTickerProviderStateMixin {
  late TabController _tabBarController;
  List<Widget> listTitre = [
    const Tab(text: "All"),
    const Tab(text: " Winter"),
    const Tab(text: "Women"),
    const Tab(text: "Popular")
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabBarController = TabController(vsync: this, length: listTitre.length);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(       
        margin: EdgeInsets.only(left: width * .01, right: width * .01),
        child: Stack(
          children: [
            Container(
              color: Colors.yellow,
              child: Center(),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: width * .07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WidgetForAll.radiusButtons(
                            icon: const Icon(Icons.drag_handle),
                            ontapAction: () {}),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            WidgetForAll.radiusButtons(
                                icon: const Icon(Icons.search),
                                ontapAction: () {}),
                            const SizedBox(
                              width: 10.0,
                            ),
                            WidgetForAll.radiusButtons(
                                icon: const Icon(Icons.card_travel),
                                ontapAction: () {})
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextStyler(
                    "Find your Style",
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  TabBar(
                      indicatorColor: Colors.transparent,
                      automaticIndicatorColorAdjustment: false,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      labelPadding: const EdgeInsets.all(15.0),
                      unselectedLabelColor: const Color.fromARGB(68, 0, 0, 0),
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 15.0, color: Colors.black54),
                      splashBorderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      controller: _tabBarController,
                      tabs: listTitre),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 400,
                    child: TabBarView(controller: _tabBarController, children: [
                      Text("Hello world"),
                      Text("Hello world"),
                      _women(width),
                      Text("Hello world"),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyler(
                        "Most Popular",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: TextStyler(
                            "see more",
                            color: Colors.orange,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ), 
                  const SizedBox(height: 5.0,), 
                  _bottomListView(context, width),
                  const SizedBox(height: 15.0,)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  SizedBox _bottomListView(BuildContext context, double width) {
    return SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 200,
                  child: ListView.builder(
                    reverse: true,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(right: 15.0),
                          physics: const BouncingScrollPhysics(),
                          itemCount: Fashion.ListFashion.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              child: Column(
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: width * .4,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: index % 2 != 0
                                              ? AppColors.listCol2
                                              : AppColors.listCol1),
                                      child: Image(
                                          image: AssetImage(Fashion
                                              .ListFashion[index].imageUrl)),
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
                                  
                                ],
                              ),
                            );
                          }),
                );
  }

  Widget _women(double width) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.only(right: 15.0),
        physics: const BouncingScrollPhysics(),
        itemCount: Fashion.ListFashion.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Detail(fashion: Fashion.ListFashion[index])));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15.0),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      width: width * .6,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          color: index % 2 != 0
                              ? AppColors.listCol2
                              : AppColors.listCol1),
                      child: Hero(
                        tag: Fashion.ListFashion[index].imageUrl,
                        child: Image(
                            image: AssetImage(Fashion.ListFashion[index].imageUrl),fit: BoxFit.cover,),
                      ),
                    ),
                    Positioned(
                        right: 10.0,
                        top: 10.0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 35.0,
                            color: Colors.black54,
                          ),
                        ))
                  ]),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    children: [
                      TextStyler(
                        "${Fashion.ListFashion[index].name} ${Fashion.ListFashion[index].property}",
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "\€",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: Fashion.ListFashion[index].price.toString(),
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ))
                          ]))
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
