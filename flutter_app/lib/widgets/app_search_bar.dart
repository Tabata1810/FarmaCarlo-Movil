import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final String placeholder;
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const AppSearchBar({
    super.key,
    this.placeholder = 'Buscar...',
    required this.value,
    required this.onChanged,
    this.onClear,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(AppSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
          suffixIcon: widget.value.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close),
                  semanticsLabel: 'Limpiar texto de búsqueda',
                  onPressed: () {
                    _controller.clear();
                    if (widget.onClear != null) widget.onClear!();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }
}