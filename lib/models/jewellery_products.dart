import 'package:flutter/material.dart';
import '../models/product.dart';

List<Product> jewelleryProducts = [
  Product(
      id: 1,
      title: "Kundan",
      price: 500,
      size: 12,
      description: dummyText,
      image: "assets/images/jewellery1.png",
      color: const Color(0xFFB491C8)),
  Product(
      id: 2,
      title: "Polki",
      price: 1200,
      size: 8,
      description: dummyText,
      image: "assets/images/jewellery2.png",
      color: const Color(0xFFEF9090)),
  Product(
      id: 3,
      title: "Meenakari",
      price: 300,
      size: 10,
      description: dummyText,
      image: "assets/images/jewellery3.png",
      color: const Color(0xFF769A92)),
  Product(
      id: 4,
      title: "Jhumkay",
      price: 700,
      size: 11,
      description: dummyText,
      image: "assets/images/jewellery4.png",
      color: const Color(0xFFEACDAA)),
  Product(
      id: 5,
      title: "Tikka",
      price: 400,
      size: 6,
      description: dummyText,
      image: "assets/images/jewellery5.png",
      color: const Color(0xFFFFA07A) // Attractive shade of Light Salmon
  ),
  Product(
      id: 6,
      title: "Chand Bali",
      price: 400,
      size: 6,
      description: dummyText,
      image: "assets/images/jwellery6.png",
      color: const Color(0xFF6A5ACD) // Attractive shade of Slate Blue
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
