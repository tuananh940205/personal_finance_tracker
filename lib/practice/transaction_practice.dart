enum TransactionType { income, expense }

class Transaction {
  final String title;
  final int amount;
  final TransactionType type;
  final String? note;

  const Transaction({
    required this.title,
    required this.amount,
    required this.type,
    this.note,
  });
}

/// Tính tổng tiền của một loại giao dịch bằng vòng lặp.
int calculateTotal(List<Transaction> transactions, TransactionType type) {
  int total = 0;

  for (final transaction in transactions) {
    if (transaction.type == type) {
      total += transaction.amount;
    }
  }

  return total;
}

/// Lọc giao dịch theo loại.
List<Transaction> filterTransactionsByType(
  List<Transaction> transactions,
  TransactionType type,
) {
  return transactions.where((transaction) => transaction.type == type).toList();
}

/// Tính tổng tiền bằng where() và fold().
int calculateTotalWithFold(
  List<Transaction> transactions,
  TransactionType type,
) {
  return transactions
      .where((transaction) => transaction.type == type)
      .fold<int>(0, (total, transaction) => total + transaction.amount);
}

/// Chuyển danh sách giao dịch thành danh sách chuỗi mô tả.
List<String> buildTransactionDescriptions(List<Transaction> transactions) {
  return transactions
      .map((transaction) => '${transaction.title}: ${transaction.amount} VND')
      .toList();
}

/// Tính tổng thu nhập và chi tiêu bằng Map.
Map<TransactionType, int> calculateTotalsByType(
  List<Transaction> transactions,
) {
  final totals = <TransactionType, int>{
    TransactionType.income: 0,
    TransactionType.expense: 0,
  };

  for (final transaction in transactions) {
    totals[transaction.type] =
        (totals[transaction.type] ?? 0) + transaction.amount;
  }

  return totals;
}

List<Transaction> filterLargeTransaction(List<Transaction> transactions, int minimumAmount) {
  return transactions.where((transaction) => transaction.amount >= minimumAmount).toList();
}

int calculateLargeExpenseTransaction(List<Transaction> transactions, int minimumAmount) {
  return transactions
      .where((transaction) => transaction.type == TransactionType.expense)
      .fold<int>(0, (total, transaction) => total + transaction.amount);
}

List<String> getExpenseList(List<Transaction> transactions) {
  return transactions
      .where((transaction) => transaction.type == TransactionType.expense)
      .map((transaction) => transaction.tile)
      .toList();
}