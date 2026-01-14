import 'package:get/get.dart';
import '../model/product.dart';
import 'package:flutter/material.dart';

class ShopController extends GetxController {
  // products list
  final List<Product> allProducts = [
    Product(
      name: 'Coffee Table Book Collection',
      price: 39.99,
      imagePath: 'assets/icon_sports.png',
      rating: 5.2,
      reviews: 3,
      category: 'Books',
    ),
    Product(
      name: 'Apple AirPods Pro',
      price: 299.99,
      imagePath: 'assets/icon_electronics.png',
      rating: 5.9,
      reviews: 1,
      category: 'Electronics',
    ),
    Product(
      name: 'Classic Denim Jacket',
      price: 82.25,
      imagePath: 'assets/icon_fashion.png',
      rating: 3.2,
      reviews: 2,
      category: 'Fashion',
    ),
    Product(
      name: 'Cow Storybook',
      price: 80.00,
      imagePath: 'assets/icon_books.png',
      rating: 5.7,
      reviews: 8,
      category: 'Books',
    ),
    Product(
      name: 'Sports Shoes',
      price: 325.99,
      imagePath: 'assets/icon_sports.png',
      rating: 4.9,
      reviews: 6,
      category: 'Sports',
    ),
    Product(
      name: 'Adidas Tango Glider 5 Football',
      price: 130,
      imagePath: 'assets/icon_sports.png',
      rating: 3.5,
      reviews: 2,
      category: 'Sports',
    ),
    Product(
      name: 'ENDURO Cruza-5B PU Football',
      price: 168.0,
      imagePath: 'assets/icon_sports.png',
      rating: 4.9,
      reviews: 8,
      category: 'Sports',
    ),
  ];

  // categories list
  final List<Category> categories = [
    Category(label: 'All', icon: Icons.grid_view),
    Category(label: 'Audio', icon: Icons.headphones),
    Category(label: 'Fashion', icon: Icons.checkroom),
    Category(label: 'Sports', icon: Icons.sports_basketball),
    Category(label: 'Books', icon: Icons.menu_book),
  ];

  final RxInt selectedCategoryIndex = 0.obs;
  final RxString searchQuery = ''.obs;

  List<Product> get filteredProducts {
    var products = allProducts;

    // Filter by category 
    if (selectedCategoryIndex.value > 0) {
      final selectedCategory = categories[selectedCategoryIndex.value].label;
      products = products.where((product) {
        return product.category == selectedCategory;
      }).toList(); 
    }

    // Filter by searchview
    if (searchQuery.value.isNotEmpty) {
      products = products.where((product) {
        return product.name.toLowerCase().contains(
              searchQuery.value.toLowerCase(),
            );
      }).toList();
    }

    return products;
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}