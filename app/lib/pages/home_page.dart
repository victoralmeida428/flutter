import 'package:app/data/http/http_client.dart';
import 'package:app/data/repositores/product_repositore.dart';
import 'package:app/page_login.dart';
import 'package:app/pages/game_page.dart';
import 'package:app/resources/app_colors.dart';
import 'package:app/store/product_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductStore store =
      ProductStore(repositore: ProductRepositore(client: HttpClient()));

  final String urlBase = 'https://ludopedia.com.br/';

  String search = '';

  @override
  void initState() {
    super.initState();
    store.getProduct('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LudoPedia'),
          backgroundColor: AppColors.deepPurpleDark,
          foregroundColor: AppColors.deepPurpleDarkComplement,
        ),
        body: AnimatedBuilder(
          animation:
              Listenable.merge([store.isLoading, store.error, store.state]),
          builder: (context, child) {
            if (store.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (store.error.value.isNotEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) => setState(() {
                              search = value;
                            }),
                            initialValue: search,
                            decoration:
                                const InputDecoration(label: Text('Pesquisa')),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                            onPressed: () {
                              store.getProduct(search);
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
                  Center(child: Text(store.error.value)),
                ],
              );
            } else if (store.state.value.isEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) => setState(() {
                              search = value;
                            }),
                            initialValue: search,
                            decoration:
                                const InputDecoration(label: Text('Pesquisa')),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                            onPressed: () {
                              store.getProduct(search);
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
                  ElevatedButton.icon(
                      onPressed: () {
                        store.getProduct(search);
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('Pesquisar')),
                  const SizedBox(height: 34),
                  const Center(child: Text("nenhum item disponivel")),
                ],
              );
            } else {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) => setState(() {
                              search = value;
                            }),
                            initialValue: search,
                            decoration:
                                const InputDecoration(label: Text('Pesquisa')),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                            onPressed: () {
                              store.getProduct(search);
                            },
                            icon: const Icon(Icons.search),
                            label: const Text('')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 34),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 32),
                      padding: const EdgeInsets.all(16),
                      itemCount: store.state.value.length,
                      itemBuilder: (_, index) {
                        final item = store.state.value[index];
                        return Center(
                          child: Column(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(item.thumb,
                                    fit: BoxFit.cover)),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(item.nmJogo,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: AppColors.deepPurpleDark)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            GameDetail(product: item)));
                              },
                            )
                          ]),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ));
  }
}
