import 'package:demo_1/feature/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:demo_1/widgets/watchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/watchlist/presentation/page/edit_watchlist_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WatchlistCubit>(
      create: (context) => WatchlistCubit()..loadWatchLists(),
      child: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Your Watch List')),
            body: ListView.separated(
              itemBuilder: (context, index) {
                return WatchlistItem(
                  watchlistItem: state.watchlistItems[index],
                  onLongItemPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          //injecting the same cubit instance to the edit page so that it can access and modify the same state
                          value: context.read<WatchlistCubit>()..initializeEditItems(),
                          child: const EditWatchlistPage(),
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.watchlistItems.length,
            ),
          );
        },
      ),
    );
  }
}
