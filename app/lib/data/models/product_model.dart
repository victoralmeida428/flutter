import 'dart:convert';
import 'dart:developer';

class ProductModel {
  final int idJogo;
  final String nmJogo;
  final String nmOriginal;
  final String thumb;
  final String link;

  ProductModel(
      {required this.idJogo,
      required this.nmJogo,
      required this.nmOriginal,
      required this.thumb,
      required this.link});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        idJogo: map['id_jogo'],
        nmJogo: map['nm_jogo'],
        nmOriginal: map['nm_original'],
        thumb: map['thumb'],
        link: map['link']);
  }
}

class DetailModel {
  final String link;
  final int  anoPub;
  final int anoNac;
  final int maxplayer;
  final int minPlayer;
  final int timePlay;
  final int idMin;
  final int tem;
  final int teve;
  final int quer;
  final int fav;
  final int jogou;

  DetailModel(
      {required this.link,
      required this.anoPub,
      required this.anoNac,
      required this.maxplayer,
      required this.minPlayer,
      required this.timePlay,
      required this.idMin,
      required this.tem,
      required this.teve,
      required this.quer,
      required this.fav,
      required this.jogou});

  factory DetailModel.fromJson(json) {
    // Decodifica o JSON para um mapa

    // Converte o mapa para um objeto DetailModel
    return DetailModel(
        link: json['link'],
        anoPub: json['ano_publicacao']?? 0,
        anoNac: json['ano_nacional']?? 0,
        maxplayer: json['qt_jogadores_max']?? 0,
        minPlayer: json['qt_jogadores_min']?? 0,
        timePlay: json['vl_tempo_jogo']?? 0,
        idMin: json['idade_minima']?? 0,
        tem: json['qt_tem'] ?? 0,
        teve: json['qt_teve'] ?? 0,
        fav: json['qt_favorito'] ?? 0,
        quer: json['qt_quer'] ?? 0,
        jogou: json['qt_jogou'] ?? 0);
  }
}
