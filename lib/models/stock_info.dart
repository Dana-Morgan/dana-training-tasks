class StockInfo {
  final int stock; // i can replace this with Book book and use book.stock instead of stock but it will reduce maintainability
  late final String warning;
  late final bool isCritical;

  StockInfo(this.stock) {
    if (stock == 0) {
      warning = 'Out of stock';
      isCritical = true;
    } else if (stock <= 2) {
      warning = 'Very low stock ($stock)';
      isCritical = true;
    } else if (stock <= 5) {
      warning = 'Low stock';
      isCritical = false;
    } else {
      warning = '';
      isCritical = false;
    }
  }
}
