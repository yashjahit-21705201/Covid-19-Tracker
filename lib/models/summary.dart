import 'package:json_annotation/json_annotation.dart';

import 'country.dart';
import 'global.dart';

part 'summary.g.dart';


@JsonSerializable(explicitToJson: true)
class Summary {

  @JsonKey(name: 'Global')
  final Global global;
  @JsonKey(name: 'Countries')
  final List<Country> countries;
  @JsonKey(name: 'Date')
  final DateTime date;


  Summary({this.global, this.countries, this.date});

  factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);

}