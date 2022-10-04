import 'package:flutter/material.dart';

class Fashion{
  Fashion({required this.name,required this.price,required this.property,required this.size,required this.imageUrl});
  late String name;
  late String property;
  late String size;
  late double price;
  late String imageUrl;
static List <Fashion> ListFashion=[
  Fashion(name:"Gorgeous" , price: 38.0, property: "Robe", size: "S", imageUrl: "assets/fonts/ImageFashion/gorgeous.png"), 
  Fashion(name: "Casuel", price: 142.0, property: "Jeans & Shoes", size: "M", imageUrl: "assets/fonts/ImageFashion/casual.png"), 
  Fashion(name: "Beach", price: 80.0, property: "Crochet Lace", size: "XL", imageUrl: "assets/fonts/ImageFashion/beach.png"), 
  Fashion(name: "Teens", price: 160.0, property: "Rob & bag", size: "XL", imageUrl: "assets/fonts/ImageFashion/fashion1.png")
];
}