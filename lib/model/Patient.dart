import 'package:flutter/material.dart';

class Patient {
  int id;

  String created_at;

  String updated_at;

  String nom;

  String prenom;

  String clef;

  int ratioPetitDej;

  int ratioDej;

  int ratioColl;
  int ratioDinnez;

  int IndiceSensibilite;

  String objectif;

  Patient(
      {this.id,
      this.created_at,
      this.updated_at,
      this.nom,
      this.prenom,
      this.clef,
      this.ratioPetitDej,
      this.ratioDej,
      this.ratioColl,
      this.ratioDinnez,
      this.IndiceSensibilite,
      this.objectif});

  factory Patient.parseJson(Map<String, dynamic> json) => Patient(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      nom: json['nom'],
      prenom: json['prenom'],
      clef: json['clef'],
      ratioPetitDej: json['ratioPetitDej'],
      ratioDej: json['ratioDej'],
      ratioColl: json['ratioColl'],
      ratioDinnez: json['ratioDinnez'],
      IndiceSensibilite: json['IndiceSensibilite'],
      objectif: json['Objectif']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': created_at,
        'updated_at': updated_at,
        'nom': nom,
        'prenom': prenom,
        'clef': clef,
        'ratioPetitDej': ratioPetitDej,
        'ratioDej': ratioDej,
        'ratioColl': ratioColl,
        'ratioDinnez': ratioDinnez,
        'IndiceSensibilite': IndiceSensibilite,
        'Objectif': objectif
      };
}
