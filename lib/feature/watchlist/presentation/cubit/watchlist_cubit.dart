import 'package:demo_1/feature/watchlist/data/dto/sample_data.dart';
import 'package:demo_1/feature/watchlist/data/dto/watchlist_data_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit() : super(WatchlistState.initial());

  void loadWatchLists() => emit(state.copyWith(watchlistItems: kSampleData));

  void initializeEditItems() => emit(state.copyWith(editItems: List.from(state.watchlistItems)));

  void reOrderItems(int oldIndex, int newIndex) {
    final editItems = List<WatchlistDataDto>.from(state.editItems);
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = editItems.removeAt(oldIndex);
    editItems.insert(newIndex, item);
    emit(state.copyWith(editItems: editItems));
  }

  void saveEditedItems() => emit(state.copyWith(watchlistItems: state.editItems, editItems: []));

  void deleteItem(int id) {
    final editedList = List<WatchlistDataDto>.from(state.editItems)..removeWhere((item) => item.id == id);
    emit(state.copyWith(editItems: editedList));
  }
}
