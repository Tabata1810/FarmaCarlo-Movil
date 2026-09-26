import 'package:flutter/material.dart';

class AsyncDataStateView extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final bool isEmpty;
  final VoidCallback? onRetry;
  final Widget child;

  const AsyncDataStateView({
    super.key,
    required this.isLoading,
    this.errorMessage,
    this.isEmpty = false,
    this.onRetry,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Estado 1: Carga
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: theme.colorScheme.primary,
        ),
      );
    }

    // Estado 2: Error
    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: theme.colorScheme.error, size: 48),
              const SizedBox(height: 12),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
              if (onRetry != null) ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Reintentar'),
                ),
              ]
            ],
          ),
        ),
      );
    }

    // Estado 3: Lista vacía
    if (isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, color: theme.colorScheme.primary.withOpacity(0.4), size: 48),
            const SizedBox(height: 12),
            Text(
              'No se encontraron registros',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    // Estado 4: Éxito
    return child;
  }
}