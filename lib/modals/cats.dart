// To parse this JSON data, do
//
//     final cats = catsFromJson(jsonString);

import 'dart:convert';

Cats catsFromJson(String str) => Cats.fromJson(json.decode(str));


class Cats {
    Cats({
        required this.fact,
        required this.length,
    });

    String fact;
    int length;

    factory Cats.fromJson(Map<String, dynamic> json) => Cats(
        fact: json["fact"],
        length: json["length"],
    );

   
}
