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
      {this.accountName,
      this.accountNumber,
      this.phoneNumber,
      this.accountBalance,
      this.deposit,
      this.withrawal,
      this.time,
      this.id});

  Account.fromMap(Map<String, dynamic> data, String id)
      : accountName = data["accountName"],
        accountNumber = data["accountNumber"],
        accountBalance = data["accountBalance"],
        deposit = data["deposit"],
        withrawal = data["withrawal"],
        time = data["time"],
        phoneNumber = data["phoneNumber"],
        id = id;

  Map<String, dynamic> toMap() {
    return {
      "accountName": accountName,
      "accountNumber": accountNumber,
      "accountBalance": accountBalance,
      "deposit": deposit,
      "withrawal": withrawal,
      "time": time,
      "phoneNumber": phoneNumber,
    };
  }
}
