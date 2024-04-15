import 'package:app/components/chart.dart';
import 'package:app/data/http/http_client.dart';
import 'package:app/data/models/product_model.dart';
import 'package:app/data/repositores/product_repositore.dart';
import 'package:app/resources/app_colors.dart';
import 'package:app/store/product_store.dart';
import 'package:flutter/material.dart';

class GameDetail extends StatefulWidget {
  final ProductModel product;
  const GameDetail({
    required this.product, // Pass the product directly to the field
  });

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  final DetailStore store =
      DetailStore(repositore: DetailRepositore(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    store.getDetail(widget.product.idJogo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.nmJogo),
        backgroundColor: AppColors.deepPurpleDark,
        foregroundColor: AppColors.deepPurpleDarkComplement,
      ),
      body: AnimatedBuilder(
          builder: (context, child) {
            if (store.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (store.error.value.isNotEmpty) {
              return Center(child: Text(store.error.value));
            } else {
              return Center(
                  child: Column(
                children: [
                  const SizedBox(height: 32),
                  Image.network(widget.product.thumb, fit: BoxFit.fitWidth),
                  Expanded(
                      child: ListView.separated(
                          padding: const EdgeInsets.all(16),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                          itemCount: store.state.value.length,
                          itemBuilder: (_, index) {
                            final item = store.state.value[index];
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    title: Text(
                                      widget.product.nmJogo,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: AppColors.fontColor),
                                    ),
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                  ),
                                  ListBody(
                                    children: [
                                      Text(
                                        'Ano de Lançamento Nacional: ${item.anoNac == 0 ? '' : item.anoNac}',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: AppColors.fontColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Ano de Publicação: ${item.anoPub}',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: AppColors.fontColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Qtd. Jogadores: ${item.minPlayer == 0} - ${item.maxplayer}',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: AppColors.fontColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Tempo médio de jogo: ${item.timePlay} minutos',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: AppColors.fontColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Idade Mínima: ${item.idMin} anos',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: AppColors.fontColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // MyBarChart(
                                  //   tem: item.tem.toString().isNotEmpty
                                  //       ? double.parse(item.tem.toString())
                                  //       : 0,
                                  //   jogou: item.tem.toString().isNotEmpty
                                  //       ? double.parse(item.jogou.toString())
                                  //       : 0,
                                  //   fav: item.tem.toString().isNotEmpty
                                  //       ? double.parse(item.fav.toString())
                                  //       : 0,
                                  //   quer: item.tem.toString().isNotEmpty
                                  //       ? double.parse(item.quer.toString())
                                  //       : 0,
                                  //   teve: item.tem.toString().isNotEmpty
                                  //       ? double.parse(item.teve.toString())
                                  //       : 0,
                                  // ),
                                  BarHorizontal(data: [
                                    ChartData(item.tem.toDouble(), 'Tem'),
                                    ChartData(item.teve.toDouble(), 'Teve'),
                                    ChartData(item.fav.toDouble(), 'Fav'),
                                    ChartData(item.jogou.toDouble(), 'Jogou'),
                                    ChartData(item.quer.toDouble(), 'Desejo')
                                  ])
                                ],
                              ),
                            );
                          }))
                ],
              ));
            }
          },
          animation:
              Listenable.merge([store.isLoading, store.error, store.state])),
    );
  }
}
