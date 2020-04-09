import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
import 'global.dart';

part 'summary.g.dart';

@JsonSerializable()
class Summary {

  @JsonKey(name: 'Global')
  final Global global;
  @JsonKey(name: 'Country')
  final List<Country> country;
  @JsonKey(name: 'Date')
  final DateTime date;


  Summary({this.global, this.country, this.date});

  factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);

}