class Account {
  final String accountName;
  final num accountNumber;
  final double accountBalance;
  final int phoneNumber;
  final double deposit;
  final double withrawal;
  final DateTime time;
  final String id;

  Account(
      [this.accountName,
      this.accountNumber,
      this.phoneNumber,
      this.accountBalance,
      this.deposit,
      this.withrawal,
      this.time]);

  Account.fromMap(Map<String, dynamic> data, String id)
      : title = data["title"],
        description = data['description'],
        author = data["author"],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "author": author,
    };
  }
}
