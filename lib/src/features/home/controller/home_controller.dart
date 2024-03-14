import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kfc/main.dart';
import 'package:kfc/src/common/services/cloud_firestore_db.dart';
import 'package:kfc/src/data/entity/kfc_model.dart';

final homeController = ChangeNotifierProvider.autoDispose((ref) => HomeController());

class HomeController with ChangeNotifier {
  HomeController() {
    fetchDataFromFirestore('combo');
    loadProductList();
  }

  List<QueryDocumentSnapshot<Map<String, dynamic>>> currentList = [];
  List<KFCModel> products = List.empty(growable: true);
  int countProducts = 0;

  Future<void> fetchDataFromFirestore(String collectionPath) async {
    currentList = await CFSServise.readAllData(collectionPath: collectionPath);
    notifyListeners();
  }

  Future<void> loadProductList() async {
    List<String>? productList = prefs.getStringList('products');
    if (productList != null) {
      products = productList.map((product) => KFCModel.fromJson(json.decode(product))).toList();
    }
    notifyListeners();
  }

  Future<void> saveProductList() async {
    List<String> productList = products.map((product) => jsonEncode(product.toJson())).toList();
    await prefs.setStringList('products', productList);
    notifyListeners();
  }

  Future<void> deleteProduct(int index) async {
    products.removeAt(index);
    notifyListeners();
  }

  void clearProducts() {
    products.clear();
    notifyListeners();
  }

  int calculateTotalPrice() {
    int total = 0;
    for (var product in products) {
      int price = int.parse(product.price);
      int countProducts = product.count;
      total += countProducts + 1 > 0 ? price * countProducts : price;
    }
    return total;
  }

  void incrementCount(int index) {
    products[index].count++;
    notifyListeners();
  }

  void decrementCount(int index) {
    if (products[index].count > 0) {
      products[index].count--;
      notifyListeners();
    }
  }
}
