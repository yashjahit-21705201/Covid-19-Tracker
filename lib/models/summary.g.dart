// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    global: json['Global'] == null
        ? null
        : Global.fromJson(json['Global'] as Map<String, dynamic>),
    countries: (json['Countries'] as List)
        ?.map((e) =>
            e == null ? null : Country.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    date: json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
  );
}

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'Global': instance.global,
      'Countries': instance.countries,
      'Date': instance.date?.toIso8601String(),
    };
