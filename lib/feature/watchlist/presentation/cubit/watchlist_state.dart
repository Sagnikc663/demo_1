part of 'watchlist_cubit.dart';

class WatchlistState extends Equatable {
  final List<WatchlistDataDto> watchlistItems;
  final List<WatchlistDataDto> editItems;

  const WatchlistState({this.watchlistItems = const [], this.editItems = const []});

  @override
  List<Object> get props => [watchlistItems, editItems];

  factory WatchlistState.initial() => const WatchlistState();

  WatchlistState copyWith({List<WatchlistDataDto>? watchlistItems, List<WatchlistDataDto>? editItems}) {
    return WatchlistState(
      watchlistItems: watchlistItems ?? this.watchlistItems,
      editItems: editItems ?? this.editItems,
    );
  }
}
