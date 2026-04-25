import 'package:equatable/equatable.dart';

class WatchlistDataDto extends Equatable {
  final String title;
  final String subtitle;
  final String? occurrence;
  final double price;
  final double changeValue;
  final double changePercent;
  final int id;

  const WatchlistDataDto({
    required this.title,
    required this.subtitle,
    this.occurrence,
    required this.price,
    required this.changeValue,
    required this.changePercent,
    required this.id,
  });

  @override
  List<Object?> get props => [title, subtitle, occurrence, price, changeValue, changePercent, id];
}
