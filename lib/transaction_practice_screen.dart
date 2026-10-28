import 'package:flutter/material.dart';

import 'practice/transaction_practice.dart';

class TransactionPracticeScreen extends StatelessWidget {
  const TransactionPracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu để thực hành Dart Collections.
    final transactions = <Transaction>[
      const Transaction(
        title: 'Lương tháng',
        amount: 18000000,
        type: TransactionType.income,
      ),
      const Transaction(
        title: 'Ăn uống',
        amount: 1500000,
        type: TransactionType.expense,
        note: 'Chi tiêu ăn uống trong tháng',
      ),
      const Transaction(
        title: 'Tiền điện',
        amount: 500000,
        type: TransactionType.expense,
      ),
      const Transaction(
        title: 'Freelance',
        amount: 2000000,
        type: TransactionType.income,
      ),
    ];

    // Tính tổng thu nhập và chi tiêu.
    final summary = calculateFinancialSummary(transactions);

    final income = summary['income'] ?? 0;
    final expense = summary['expense'] ?? 0;
    final balance = summary['balance'] ?? 0;

    // Lọc riêng các khoản chi tiêu.
    final expenseTransactions = filterTransactionsByType(
      transactions,
      TransactionType.expense,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Personal Finance Tracker')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Thẻ tổng quan tài chính.
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Số dư hiện tại', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(
                    '$balance VND',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text('Tổng thu nhập: $income VND'),
                  Text('Tổng chi tiêu: $expense VND'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Danh sách chỉ gồm các giao dịch chi tiêu.
          const Text(
            'Các khoản chi tiêu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          if (expenseTransactions.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text('Chưa có khoản chi tiêu nào.'),
            ),

          for (final transaction in expenseTransactions)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                child: Icon(Icons.shopping_bag_outlined),
              ),
              title: Text(transaction.title),
              subtitle: transaction.note == null
                  ? null
                  : Text(transaction.note!),
              trailing: Text(transaction.formattedAmount),
            ),
        ],
      ),
    );
  }
}
