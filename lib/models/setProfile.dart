import 'dart:convert';

SetProfile setProfileFromJson(String str) => SetProfile.fromJson(json.decode(str));

String setProfileToJson(SetProfile data) => json.encode(data.toJson());

class SetProfile {
  SetProfile({
    required this.uid,
    required this.gender,
    required this.images,
    required this.drinking,
    required this.age,
    required this.location,
    required this.interest,
    required this.lookingFor,
    this.bodyType,
    required this.smoking,
    this.sexualOrientation,
    this.bedroomChoices,
    this.relationshipStatus,
    this.travelPlans,
  });

  String uid;
  String gender;
  List<String> images;
  bool drinking;
  int age;
  String location;
  List<String> interest;
  List<String> lookingFor;
  String ? bodyType;
  bool smoking;
  String ? sexualOrientation;
  String ? bedroomChoices;
  String ? relationshipStatus;
  List<String> ? travelPlans;

  factory SetProfile.fromJson(Map<String, dynamic> json) => SetProfile(
    uid: json["uid"],
    gender: json["gender"],
    images: List<String>.from(json["images"].map((x) => x)),
    drinking: json["drinking"],
    age: json["age"],
    location: json["location"],
    interest: List<String>.from(json["interest"].map((x) => x)),
    lookingFor: List<String>.from(json["lookingFor"].map((x) => x)),
    bodyType: json["bodyType"],
    smoking: json["smoking"],
    sexualOrientation: json["sexualOrientation"],
    bedroomChoices: json["bedroomChoices"],
    relationshipStatus: json["relationshipStatus"],
    travelPlans: List<String>.from(json["travelPlans"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "gender": gender,
    "images": List<dynamic>.from(images.map((x) => x)),
    "drinking": drinking,
    "age": age,
    "location": location,
    "interest": List<dynamic>.from(interest.map((x) => x)),
    "lookingFor": List<dynamic>.from(lookingFor.map((x) => x)),
    "bodyType": bodyType,
    "smoking": smoking,
    "sexualOrientation": sexualOrientation,
    "bedroomChoices": bedroomChoices,
    "relationshipStatus": relationshipStatus,
    "travelPlans": List<dynamic>.from(travelPlans!.map((x) => x)),
  };
}
