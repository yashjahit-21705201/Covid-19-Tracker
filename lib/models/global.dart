import 'package:json_annotation/json_annotation.dart';

part 'global.g.dart';

@JsonSerializable(explicitToJson: true)
class Global {
  @JsonKey(name: 'NewConfirmed')
  final int newConfirmed;
  @JsonKey(name: 'TotalConfirmed')
  final int totalConfirmed;
  @JsonKey(name: 'NewDeaths')
  final int newDeaths;
  @JsonKey(name: 'TotalDeaths')
  final int totalDeaths;
  @JsonKey(name: 'NewRecovered')
  final int newRecovered;
  @JsonKey(name: 'TotalRecovered')
  final int totalRecovered;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  factory Global.fromJson(Map<String, dynamic> json) => _$GlobalFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalToJson(this);

}
