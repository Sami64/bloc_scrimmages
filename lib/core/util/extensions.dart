/// Extension on Strings
extension StringExtension on String {
  /// Convert the first string to capital case≈
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}
