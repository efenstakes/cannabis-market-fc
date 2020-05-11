import 'package:flutter/material.dart';



class Product {
  String id;
  String name;
  String description;
  String priceRange;
  String vibe;
  String type; // hybrid or natural
  String thc;
  String image;
  Color backgroundColor;

  Product({
    this.id,
    this.name,
    this.description,
    this.priceRange,
    this.vibe,
    this.type,
    this.thc,
    this.image,
    this.backgroundColor,
  });
}


List<Product> productList = [

  Product(
    id: '1',
    name: 'Blue Dream',
    description: 'Hot weed',
    priceRange: '150 - 460',
    vibe: 'Creative',
    type: 'Hybrid',
    thc: '26',
    image: 'blue-dream.jpg',
    backgroundColor: Color(0xfff519185),
  ),
  Product(
    id: '2',
    name: 'Strawberry Cough',
    description: 'Hot weed',
    priceRange: '140 - 440',
    vibe: 'Energetic',
    type: 'Hybrid',
    thc: '33',
    image: 'strawberry-cough.jpg',
    backgroundColor: Color(0xfffa99ac3),
  ),
  Product(
    id: '3',
    name: 'NYC Diesel',
    description: 'Hot weed',
    priceRange: '230 - 560',
    vibe: 'Calming',
    type: 'Natural',
    thc: '47',
    image: 'nyc-diesel.jpg',
    backgroundColor: Color(0xfff2a2920),
  ),
  Product(
    id: '4',
    name: 'Sour Diesel',
    description: 'Hot weed',
    priceRange: '150 - 460',
    vibe: 'Creative',
    type: 'Hybrid',
    thc: '53',
    image: 'sour-diesel.jpg',
    backgroundColor: Color(0xfff505229),
  ),
  Product(
    id: '5',
    name: 'White Widow',
    description: 'Hot weed',
    priceRange: '150 - 460',
    vibe: 'Creative',
    type: 'Hybrid',
    thc: '26',
    image: 'white-widow.png',
    backgroundColor: Color(0xfff519185),
  ),
  Product(
    id: '6',
    name: 'Quebec Gold',
    description: 'Hot weed',
    priceRange: '150 - 460',
    vibe: 'Creative',
    type: 'Hybrid',
    thc: '66',
    image: 'quebec-gold.jpg',
    backgroundColor: Color(0xfffa99ac3),
  ),
  Product(
    id: '7',
    name: 'Cannabis Ruderalis',
    description: 'Hot weed',
    priceRange: '190 - 760',
    vibe: 'Creative',
    type: 'Hybrid',
    thc: '33',
    image: 'cannabis-ruderalis.jpg',
    backgroundColor: Color(0xfff2a2920),
  ),
  Product(
    id: '8',
    name: 'Haze',
    description: 'Hot weed',
    priceRange: '110 - 360',
    vibe: 'Happy',
    type: 'Hybrid',
    thc: '45',
    image: 'haze.png',
    backgroundColor: Color(0xfff505229),
  ),
  Product(
    id: '9',
    name: 'Durban Poison',
    description: 'Hot weed',
    priceRange: '250 - 510',
    vibe: 'Party Mood',
    type: 'Hybrid',
    thc: '77',
    image: 'durban-poison.jpg',
    backgroundColor: Color(0xfff519185),
  ),
  Product(
    id: '10',
    name: 'Super Lemon Haze',
    description: 'Hot weed',
    priceRange: '270 - 660',
    vibe: 'Hyped',
    type: 'Natural',
    thc: '55',
    image: 'super-lemon-haze.jpg',
    backgroundColor: Color(0xfff2a2920),
  ),
  Product(
    id: '11',
    name: 'Panama Red',
    description: 'Hot weed',
    priceRange: '430 - 1000',
    vibe: 'Creative',
    type: 'Hybrid',
    thc: '84',
    image: 'panama-red.png',
    backgroundColor: Color(0xfffa99ac3),
  ),
  Product(
    id: '12',
    name: 'Afghanica',
    description: 'Hot weed',
    priceRange: '430 - 1000',
    vibe: 'Rowdy',
    type: 'Hybrid',
    thc: '84',
    image: 'afghanica.jpg',
    backgroundColor: Color(0xfff505229),
  ),

];