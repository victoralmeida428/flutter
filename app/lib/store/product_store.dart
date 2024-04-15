import 'package:app/data/models/product_model.dart';
import 'package:app/data/repositores/product_repositore.dart';
import 'package:flutter/material.dart';

class ProductStore {
  final IProductRepositore repositore;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<ProductModel>> state =
      ValueNotifier<List<ProductModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  ProductStore({required this.repositore});

  Future getProduct(jogo) async {
    isLoading.value = true;

    try {
      final result = await repositore.getProduct(jogo);
      state.value = result;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}

class DetailStore {
  final IDetailRepositore repositore;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<DetailModel>> state =
      ValueNotifier<List<DetailModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  DetailStore({required this.repositore});

  Future getDetail(id) async {
    isLoading.value = true;

    try {
      final result = await repositore.getDetail(id);
      state.value = result;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}


