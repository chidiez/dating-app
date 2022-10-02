import 'dart:convert';

FilterAll filterAllFromJson(String str) => FilterAll.fromJson(json.decode(str));

String filterAllToJson(FilterAll data) => json.encode(data.toJson());

class FilterAll {
  FilterAll({
    required this.upperAge,
    required this.lowerAge,
    required this.gender,
    this.lookingFor,
  });

  int upperAge;
  int lowerAge;
  String gender;
  List<String> ? lookingFor;

  factory FilterAll.fromJson(Map<String, dynamic> json) => FilterAll(
    upperAge: json["upperAge"],
    lowerAge: json["lowerAge"],
    gender: json["gender"],
    lookingFor: List<String>.from(json["lookingFor"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "upperAge": upperAge,
    "lowerAge": lowerAge,
    "gender": gender,
    "lookingFor": List<dynamic>.from(lookingFor!.map((x) => x)),
  };
}
