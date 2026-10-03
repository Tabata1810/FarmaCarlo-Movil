import 'package:flutter/material.dart';

class EntityCard extends StatelessWidget {
  final String title;
  final String? badgeText;
  final List<Widget> details;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const EntityCard({
    super.key,
    required this.title,
    this.badgeText,
    required this.details,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                if (badgeText != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      badgeText!,
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const Divider(height: 20.0),
            ...details,
            if (onEdit != null || onDelete != null) ...[
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onEdit != null)
                    IconButton(
                      icon: Icon(Icons.edit, color: theme.colorScheme.primary),
                      semanticsLabel: 'Editar registro',
                      onPressed: onEdit,
                    ),
                  if (onDelete != null)
                    IconButton(
                      icon: Icon(Icons.delete, color: theme.colorScheme.error),
                      semanticsLabel: 'Eliminar registro',
                      onPressed: onDelete,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}