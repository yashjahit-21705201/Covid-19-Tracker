// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Global _$GlobalFromJson(Map<String, dynamic> json) {
  return Global(
    newConfirmed: json['NewConfirmed'] as int,
    totalConfirmed: json['TotalConfirmed'] as int,
    newDeaths: json['NewDeaths'] as int,
    totalDeaths: json['TotalDeaths'] as int,
    newRecovered: json['NewRecovered'] as int,
    totalRecovered: json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$GlobalToJson(Global instance) => <String, dynamic>{
      'NewConfirmed': instance.newConfirmed,
      'TotalConfirmed': instance.totalConfirmed,
      'NewDeaths': instance.newDeaths,
      'TotalDeaths': instance.totalDeaths,
      'NewRecovered': instance.newRecovered,
      'TotalRecovered': instance.totalRecovered,
    };
