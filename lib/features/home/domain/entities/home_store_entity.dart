import 'package:equatable/equatable.dart';

class HomeStoreEntity extends Equatable {
  final int id;
  final bool? isNew;
  final bool? isFavorites;
  final String title;
  final String subtitle;
  final String picture;
  final bool isBuy;

  const HomeStoreEntity({
    required this.id,
    this.isNew,
    this.isFavorites,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });

  @override
  List<Object?> get props =>
      [id, isNew, isFavorites, title, subtitle, picture, isBuy];
}
