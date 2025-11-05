class Formatters {
  Formatters._();

  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  static String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }

  static String formatDateTime(DateTime dateTime) {
    final date = formatDate(dateTime);
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$date $hour:$minute';
  }

  static DateTime? parseDate(String dateString) {
    try {
      final parts = dateString.split('/');
      if (parts.length != 3) return null;

      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);

      return DateTime(year, month, day);
    } on FormatException {
      return null;
    }
  }

  static String formatDateForDb(DateTime date) {
    return date.toIso8601String();
  }

  static DateTime parseDateFromDb(String dateString) {
    return DateTime.parse(dateString);
  }
}
