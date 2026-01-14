import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imagePath;
  final double rating;
  final int reviews;
  final String category;

  Product({
    required this.name, 
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.reviews,
    required this.category,
  });
}

class Category {
  final String label;
  final IconData icon;

  Category({
    required this.label,
    required this.icon,
  });
}

