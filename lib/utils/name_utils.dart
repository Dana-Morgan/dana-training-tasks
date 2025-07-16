String formatDisplayName(String name) {
  final cleaned = name.replaceAll(RegExp(r'[^a-zA-Z\s]'), ' ');

  final singleSpaced = cleaned.replaceAll(RegExp(r'\s+'), ' ');

  final trimmed = singleSpaced.trim();

  if (trimmed.isEmpty) return '';

  final words = trimmed.split(' ');

  final capitalizedWords = words.map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  });

  return capitalizedWords.join(' ');
}
