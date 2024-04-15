import 'dart:convert';
import 'dart:developer';
import 'package:app/data/http/exceptions.dart';
import 'package:app/data/http/http_client.dart';
import 'package:app/data/models/product_model.dart';

abstract class IProductRepositore {
  Future<List<ProductModel>> getProduct(jogo);
}

class ProductRepositore implements IProductRepositore {
  final IHttpClient client;

  ProductRepositore({required this.client});

  @override
  Future<List<ProductModel>> getProduct(jogo) async {
    final String url;
    if (jogo.isEmpty) {
      url = 'https://ludopedia.com.br/api/v1/jogos';
    } else {
      url = 'https://ludopedia.com.br/api/v1/jogos?search=$jogo';
    }
    log(url);
    final response = await client.get(url: url);

    if (response.statusCode == 200) {
      final List<ProductModel> products = [];

      final body = jsonDecode(response.body);

      body['jogos'].map((item) {
        final ProductModel product = ProductModel.fromMap(item);
        products.add(product);
      }).toList();

      return products;
    } else {
      throw NotFoundExceptions('url inválida');
    }
  }
}

abstract class IDetailRepositore {
  Future<List<DetailModel>> getDetail(id);
}

class DetailRepositore implements IDetailRepositore {
  final IHttpClient client;

  DetailRepositore({required this.client});

  @override
  Future<List<DetailModel>> getDetail(id) async {
    log('https://ludopedia.com.br/api/v1/jogos/$id');
    final response =
        await client.get(url: 'https://ludopedia.com.br/api/v1/jogos/$id');
    if (response.statusCode == 200) {
      final List<DetailModel> details = [];

      final body = jsonDecode(response.body);

      final DetailModel detail = DetailModel.fromJson(body);
      details.add(detail);

      return details;
    } else {
      throw NotFoundExceptions('url inválida');
    }
  }
}
