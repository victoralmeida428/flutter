import 'package:flutter/material.dart';

Widget searchBar(ProductS) {
  return Padding(
    padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(label: Text('pesquisa')),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text('Pesquisar')),
        ],
      ),
  );
}
