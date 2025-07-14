String formatDisplayName(String name) {
  final cleaned = name.replaceAll(RegExp(r'[^a-zA-Z\s]'), ' ');

  final singleSpaced = cleaned.replaceAll(RegExp(r'\s+'), ' ');

  final trimmed = singleSpaced.trim();

  if (trimmed.isEmpty) return '';

  return trimmed[0].toUpperCase() + trimmed.substring(1).toLowerCase();
}
