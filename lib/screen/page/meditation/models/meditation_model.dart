import 'dart:convert';

import 'package:flutter/foundation.dart';

// class BishkekCityModel {
//   final List<ZarydkaModel> meditation;
//   BishkekCityModel({
//     required this.meditation,
//   });

//   BishkekCityModel.fromJson(Map<String, dynamic> map) {
//     if (json['Yoga'] != null) {
//       yoga = <Yoga>[];
//       json['Yoga'].forEach((v) {
//         yoga!.add(Yoga.fromJson(v));
//       });
//     }
//   }
// }

// class BishkekCityModel {
//   List<ZarydkaModel> yoga;

//   BishkekCityModel({required this.yoga});

//   BishkekCityModel.fromJson(Map<String, dynamic> json) {
//     if (json['Yoga'] != null) {
//       yoga = <ZarydkaModel>[];
//       json['Yoga'].forEach((v) {
//         yoga.add(ZarydkaModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Yoga'] = yoga.map((v) => v.toJson()).toList();
//     return data;
//   }
// }

class ZarydkaModel {
  final List<NoviceTabBar> novice;
  final List<NoviceTabBar> amateur;
  final List<NoviceTabBar> professional;
  ZarydkaModel({
    required this.novice,
    required this.amateur,
    required this.professional,
  });

  ZarydkaModel copyWith({
    List<NoviceTabBar>? novice,
    List<NoviceTabBar>? amateur,
    List<NoviceTabBar>? professional,
  }) {
    return ZarydkaModel(
      novice: novice ?? this.novice,
      amateur: amateur ?? this.amateur,
      professional: professional ?? this.professional,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'novice': novice.map((x) => x.toMap()).toList()});
    result.addAll({'amateur': amateur.map((x) => x.toMap()).toList()});
    result
        .addAll({'professional': professional.map((x) => x.toMap()).toList()});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ZarydkaModel(novice: $novice, amateur: $amateur, professional: $professional)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ZarydkaModel &&
        listEquals(other.novice, novice) &&
        listEquals(other.amateur, amateur) &&
        listEquals(other.professional, professional);
  }

  @override
  int get hashCode =>
      novice.hashCode ^ amateur.hashCode ^ professional.hashCode;

 factory ZarydkaModel.fromJson(Map<String, dynamic> map) {
  return ZarydkaModel(
    novice: (map['novice'] as List<dynamic>?)
        ?.map((x) => NoviceTabBar.fromMap(x))
        .toList() ?? [],
    amateur: (map['amateur'] as List<dynamic>?)
        ?.map((x) => NoviceTabBar.fromMap(x))
        .toList() ?? [],
    professional: (map['professional'] as List<dynamic>?)
        ?.map((x) => NoviceTabBar.fromMap(x))
        .toList() ?? [],
  );
}

   
}

class NoviceTabBar {
  final String title;
  final String mainImage;
  final int lessons;
  final List<YogaPlans> yogaPlans;
  NoviceTabBar({
    required this.title,
    required this.mainImage,
    required this.lessons,
    required this.yogaPlans,
  });

  NoviceTabBar copyWith({
    String? title,
    String? mainImage,
    int? lessons,
    List<YogaPlans>? yogaPlans,
  }) {
    return NoviceTabBar(
      title: title ?? this.title,
      mainImage: mainImage ?? this.mainImage,
      lessons: lessons ?? this.lessons,
      yogaPlans: yogaPlans ?? this.yogaPlans,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'mainImage': mainImage});
    result.addAll({'lessons': lessons});
    result.addAll({'yogaPlans': yogaPlans.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NoviceTabBar.fromMap(Map<String, dynamic> map) {
    return NoviceTabBar(
      title: map['title'] ?? '',
      mainImage: map['mainImage'] ?? '',
      lessons: map['lessons']?.toInt() ?? 0,
      yogaPlans: List<YogaPlans>.from(
          map['yogaPlans']?.map((x) => YogaPlans.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoviceTabBar.fromJson(String source) =>
      NoviceTabBar.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoviceTabBar(title: $title, mainImage: $mainImage, lessons: $lessons, yogaPlans: $yogaPlans)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoviceTabBar &&
        other.title == title &&
        other.mainImage == mainImage &&
        other.lessons == lessons &&
        listEquals(other.yogaPlans, yogaPlans);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        mainImage.hashCode ^
        lessons.hashCode ^
        yogaPlans.hashCode;
  }
}

class YogaPlans {
  final String image;
  final String title;
  final int min;
  final String desciption;
  YogaPlans({
    required this.image,
    required this.title,
    required this.min,
    required this.desciption,
  });

  YogaPlans copyWith({
    String? image,
    String? title,
    int? min,
    String? desciption,
  }) {
    return YogaPlans(
      image: image ?? this.image,
      title: title ?? this.title,
      min: min ?? this.min,
      desciption: desciption ?? this.desciption,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image': image});
    result.addAll({'title': title});
    result.addAll({'min': min});
    result.addAll({'desciption': desciption});

    return result;
  }

  factory YogaPlans.fromMap(Map<String, dynamic> map) {
    return YogaPlans(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      min: map['min']?.toInt() ?? 0,
      desciption: map['desciption'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory YogaPlans.fromJson(String source) =>
      YogaPlans.fromMap(json.decode(source));

  @override
  String toString() {
    return 'YogaPlans(image: $image, title: $title, min: $min, desciption: $desciption)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is YogaPlans &&
        other.image == image &&
        other.title == title &&
        other.min == min &&
        other.desciption == desciption;
  }

  @override
  int get hashCode {
    return image.hashCode ^ title.hashCode ^ min.hashCode ^ desciption.hashCode;
  }
}
