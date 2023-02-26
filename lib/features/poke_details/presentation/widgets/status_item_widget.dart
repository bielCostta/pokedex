part of '../page/poke_details.dart';

class _StatusItemWidget extends StatelessWidget {
  const _StatusItemWidget({
    super.key,
    required this.name,
    required this.statusValue,
    this.statusColor = Colors.blue,
  });
  final String name;
  final int statusValue;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PokeMeasures.base),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$name:',
              textAlign: TextAlign.left,
              style: theme.textTheme.button!.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                left: PokeMeasures.base,
                top: PokeMeasures.base / 2.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(PokeMeasures.base),
                child: RepaintBoundary(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: statusValue / 100.0),
                    curve: Curves.easeOut,
                    duration: const Duration(seconds: 1),
                    builder: (context, value, _) {
                      return LinearProgressIndicator(
                        value: value,
                        color: statusColor,
                        backgroundColor: Colors.black.withOpacity(.16),
                        minHeight: 24.0,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
