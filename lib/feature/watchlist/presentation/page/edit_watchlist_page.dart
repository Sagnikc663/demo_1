import 'package:demo_1/feature/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWatchlistPage extends StatelessWidget {
  const EditWatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textScaler = MediaQuery.textScalerOf(context);
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, state) {
        final cubit = context.read<WatchlistCubit>();
        return Scaffold(
          appBar: AppBar(title: const Text('Edit Watchlist')),
          body: Column(
            children: [
              Expanded(
                child: ReorderableListView.builder(
                  onReorder: cubit.reOrderItems,
                  itemCount: state.editItems.length,
                  itemBuilder: (context, index) {
                    final item = state.editItems[index];
                    return Column(
                      key: ValueKey(item.id),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          //key is needed for ReorderableListView to identify the item during reordering
                          key: ValueKey(item.id),
                          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                          visualDensity: VisualDensity.compact,
                          leading: Icon(Icons.list),
                          title: Text(
                            item.title,
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: textScaler.scale(14),
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          trailing: InkResponse(child: Icon(Icons.delete)),
                          onTap: () => cubit.deleteItem(item.id),
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 1,
                      side: BorderSide(color: colorScheme.outline),
                    ),
                    child: Text(
                      'Edit other watchlists',
                      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSurface),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.saveEditedItems();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: Text(
                      'Save Watchlist',
                      style: textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
