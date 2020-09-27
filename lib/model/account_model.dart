class Account {
  final String accountName;
  final num accountNumber;
  final double accountBalance;
  final int phoneNumber;
  final double deposit;
  final double withrawal;
  final DateTime time;

  Account(
      [this.accountName,
      this.accountNumber,
      this.phoneNumber,
      this.accountBalance,
      this.deposit,
      this.withrawal,
      this.time]);
}
