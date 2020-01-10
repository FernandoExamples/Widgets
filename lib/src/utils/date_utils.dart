String formatDate(DateTime dateTime) {
  String day = dateTime.day <= 9 ? '0${dateTime.day}' : '${dateTime.day}';
  String month =
      dateTime.month <= 9 ? '0${dateTime.month}' : '${dateTime.month}';

  return '$day / $month / ${dateTime.year}';
}
