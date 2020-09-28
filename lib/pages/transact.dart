import 'package:flutter/material.dart';
import 'package:mock_banker/model/account_model.dart';
import 'package:mock_banker/model/firebase_service.dart';

class Transact extends StatefulWidget {
  final Account account;

  const Transact({Key key, this.account}) : super(key: key);
  @override
  _TransactState createState() => _TransactState();
}

class _TransactState extends State<Transact> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _depositController;
  TextEditingController _withdrawController;

  FocusNode _accountNode;

  @override
  void initState() {
    super.initState();

    _depositController = TextEditingController();
    _withdrawController = TextEditingController();
    _accountNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    Account account = Account();
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Window"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("${account.accountName} : ${account.accountNumber}"),
              const SizedBox(height: 20.0),
              TextFormField(
                focusNode: _accountNode,
                controller: _depositController,
                decoration: InputDecoration(
                  labelText: "Deposit",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                focusNode: _accountNode,
                controller: _withdrawController,
                decoration: InputDecoration(
                  labelText: "withdraw",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("Save"),
                onPressed: () async {
                  if (_key.currentState.validate()) {
                    Account account = Account(
                      deposit: double.parse(_depositController.text),
                      withrawal: double.parse(_withdrawController.text),
                    );
                    await FirestoreService().addAccount(account);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
