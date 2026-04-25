import 'package:demo_1/feature/watchlist/data/dto/watchlist_data_dto.dart';
import 'package:flutter/material.dart';

class WatchlistItem extends StatelessWidget {
  final WatchlistDataDto watchlistItem;
  final VoidCallback onLongItemPress;

  const WatchlistItem({required this.watchlistItem, required this.onLongItemPress, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textScaler = MediaQuery.textScalerOf(context);
    final subtitle =
        '${watchlistItem.subtitle} ${watchlistItem.occurrence != null ? '| ${watchlistItem.occurrence}' : ''}';
    return ListTile(
      onLongPress: onLongItemPress,
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      visualDensity: VisualDensity.compact,
      dense: true,
      title: Text(
        watchlistItem.title,
        style: textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: textScaler.scale(14),
          color: colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodySmall?.copyWith(fontSize: textScaler.scale(12), color: colorScheme.onSurfaceVariant),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '${watchlistItem.price}',
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: textScaler.scale(12),
              color: (watchlistItem.changeValue) >= 0 ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${watchlistItem.changeValue} (${watchlistItem.changePercent}%)',
            style: textTheme.bodySmall?.copyWith(fontSize: textScaler.scale(10), color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
