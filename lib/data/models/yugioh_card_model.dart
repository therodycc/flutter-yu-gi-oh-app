import '../../domain/entities/yugioh_card.dart';

class YugiohCardModel extends YugiohCard {
  const YugiohCardModel({
    required super.name,
    required super.type,
    required super.imageUrl,
  });

  factory YugiohCardModel.fromJson(Map<String, dynamic> json) {
    return YugiohCardModel(
      name: json['name'] ?? 'Sin nombre',
      type: json['type'] ?? 'Sin tipo',

      imageUrl:
          json['card_images']?[0]?['image_url'] ??
          'https://via.placeholder.com/150',
    );
  }
}
